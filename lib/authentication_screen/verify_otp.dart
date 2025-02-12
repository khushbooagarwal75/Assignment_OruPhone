import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/page_title.dart';

class VerifyOtp extends StatefulWidget {
  final String verificationId; // Required parameter
  final String phone;

  const VerifyOtp({super.key, required this.verificationId, required this.phone});

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());
  bool isLoading = false;

  void verifyOtp() async {
    String otp = otpControllers.map((controller) => controller.text).join();

    if (otp.length != 6) {  // Firebase OTP is 6 digits
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid 6-digit OTP")));
      return;
    }

    setState(() => isLoading = true);

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, // Using verificationId here
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP Verified Successfully!")));

      // Navigate to the next screen after successful verification
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP verification failed: ${e.message}")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.xmark),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/logo.png")),
            const SizedBox(height: 50),

            PageTitle(
              pageTitle: 'Verify Mobile No.',
              pageSubTitle: "Please enter the 6-digit verification code sent to ${widget.phone} via SMS",
            ),

            const SizedBox(height: 100),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: otpControllers[index],
                    focusNode: otpFocusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
                      }
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 80),

            // "Didn't receive OTP?" Text
            const Center(
              child: Text(
                "Didn't receive OTP?",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            const SizedBox(height: 10),

            // Resend OTP Timer
            const Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Resend OTP ',
                      style: TextStyle(fontSize: 17, decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: 'in ', style: TextStyle(fontSize: 17)),
                    TextSpan(text: 'Sec', style: TextStyle(fontSize: 17)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 100),

            // Verify OTP Button
            CustomButton(
              buttonText: isLoading ? "Verifying..." : "Verify OTP",
              showIcon: false,
              onTap: verifyOtp,
            ),
          ],
        ),
      ),
    );
  }
}
