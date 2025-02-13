import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/confirm_name.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/login_screen.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _initializeApp(BuildContext context) async {
    await _requestPermissions();
    await _checkAuthentication(context);
  }

  Future<void> _requestPermissions() async {
    await Permission.notification.request();
  }

  Future<void> _checkAuthentication(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    User? user = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name');

    if (user != null) {
      _navigateToScreen(context, userName == null || userName.isEmpty ? const ConfirmNameScreen() : const HomeScreen());
    } else {
      _navigateToScreen(context, const LoginScreen());
    }
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeApp(context));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/Splash.json"),
      ),
    );
  }
}
