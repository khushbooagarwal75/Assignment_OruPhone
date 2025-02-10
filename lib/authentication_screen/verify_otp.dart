import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/page_title.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> otpControllers =
    List.generate(4, (index) => TextEditingController());
    final List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());

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

            // Page Title with Bold Styling
            PageTitle(
              pageTitle: 'Verify Mobile No.',
              pageSubTitle: "Please enter the 4-digit verification code sent to your mobile number +91-7587329682 via SMS",
            ),

            const SizedBox(height: 100),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
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
                      if (value.isNotEmpty && index < 3) {
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
            const CustomButton(buttonText: "Verify OTP", showIcon: false),
          ],
        ),
      ),
    );
  }
}
