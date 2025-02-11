import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/page_title.dart';

void showVerifyOtpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets, // To handle keyboard
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_backspace),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Verify OTP"),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(CupertinoIcons.xmark),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade100,),
              Text("Please enter the 4-digit verification code sent to your mobile number +91-7587329682 via SMS",
              ),

              const SizedBox(height: 30),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 40,
                    child: TextField(
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
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 30),

              // Verify OTP Button
              const CustomButton(buttonText: "Verify OTP", showIcon: false),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
