import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/home_screen.dart';
import 'package:flutter_assignment_oruphones/authentication_screen/verify_otp.dart';

class OtpProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController phoneController = TextEditingController(text: "+91 ");
  final FocusNode phoneFocusNode = FocusNode(); // Keeps focus on input field

  String _verificationId = "";
  bool _isLoading = false;

  // Getters
  String get verificationId => _verificationId;
  bool get isLoading => _isLoading;

  // Set loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Send OTP
  Future<void> sendOTP(BuildContext context) async {
    String phone = phoneController.text.trim();
    if (phone.length < 13) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a valid phone number")),
      );
      return;
    }

    setLoading(true);

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _navigateToHome(context);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
        setLoading(false);
      },
      codeSent: (String verId, int? resendToken) {
        _verificationId = verId;
        notifyListeners();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return VerifyOtp(phone: phone, verificationId: _verificationId);
        }));
      },
      codeAutoRetrievalTimeout: (String verId) {
        _verificationId = verId;
        notifyListeners();
      },
      timeout: const Duration(seconds: 60),
    );

    setLoading(false);
  }

  // Verify OTP
  Future<void> verifyOtp(String otp, BuildContext context) async {
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 6-digit OTP")),
      );
      return;
    }

    setLoading(true);

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully!")),
      );

      _navigateToHome(context);

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP verification failed: ${e.message}")),
      );
    }

    setLoading(false);
  }

  // Navigate to home screen
  void _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false, // Remove all previous routes from stack
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }
}
