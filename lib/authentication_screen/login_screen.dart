import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/page_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController(text: "+91 ");

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
              pageTitle: 'Welcome',
              pageSubTitle: 'Sign in to continue' ),
            const SizedBox(height: 100),

            // Mobile Number Input
            const Text(
              "Enter Your Phone Number",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.phone,
              // inputFormatters: [
              //   FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              //   LengthLimitingTextInputFormatter(13), // Limit to +91 XXXXXXXX (10 digits)
              // ],
              onChanged: (value) {
                if (!value.startsWith("+91 ")) {
                  phoneController.text = "+91 ";
                  phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: phoneController.text.length),
                  );
                }
              },
              decoration: const InputDecoration(
                hintText: "Mobile Number",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), // Lesser circular radius
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 80),

            // Terms and Conditions with Checkbox
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}), // Static checkbox (for now)
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

            // Submit Button
            CustomButton(buttonText: "Next", showIcon: true,)
          ],
        ),
      ),
    );
  }
}
