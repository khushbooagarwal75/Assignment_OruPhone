import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/page_title.dart';
import 'verify_otp.dart';

class ConfirmNameScreen extends StatefulWidget {
  const ConfirmNameScreen({super.key});

  @override
  _ConfirmNameScreenState createState() => _ConfirmNameScreenState();
}

class _ConfirmNameScreenState extends State<ConfirmNameScreen> {
  final TextEditingController phoneController = TextEditingController(text: "+91 ");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String verificationId = "";

  void sendOTP() async {
    String phone = phoneController.text.trim();

    if (phone.length < 13) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Enter a valid phone number"))
      );
      return;
    }

    setState(() => isLoading = true);

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}"))
        );
        setState(() => isLoading = false);
      },
      codeSent: (String verId, int? resendToken) {
        verificationId = verId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtp(verificationId: verificationId, phone: phone),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
      timeout: const Duration(seconds: 60),
    );

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.xmark),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              const SizedBox(height: 50),
              PageTitle(pageTitle: 'Welcome', pageSubTitle: 'Sign in to continue'),
              const SizedBox(height: 100),
          
              const Text("Enter Your Name", style: TextStyle(fontSize: 13)),
              const SizedBox(height: 5),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 80),
          
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Accept '),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            color: Colors.indigo,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
          
              CustomButton(
                buttonText: isLoading ? "Sending..." : "Next",
                showIcon: true,
                onTap: sendOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
