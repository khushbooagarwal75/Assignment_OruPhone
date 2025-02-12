import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/home_screen.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/login_screen.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/verify_otp.dart';
import 'package:flutter_assignment_oruphones/landing_pages/mobile_guest_mode.dart';
import 'package:flutter_assignment_oruphones/landing_pages/mobile_loggedIn_mode.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) {
        return LoginScreen();
      },)); 
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          "assets/Splash.json",
        ),
      ),
    );
  }
}