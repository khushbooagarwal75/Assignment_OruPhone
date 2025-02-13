import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/provider/otp_provider.dart';
import 'package:provider/provider.dart';
import '../components/custom_button.dart';
import '../components/page_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents keyboard overflow
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.xmark),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard when tapping outside
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height, // Ensure it fills screen
              ),
              child: IntrinsicHeight( // Adjusts height dynamically
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/logo.png", height: 120)),
                    const SizedBox(height: 30),

                    const PageTitle(pageTitle: 'Welcome', pageSubTitle: 'Sign in to continue'),
                    const SizedBox(height: 30),

                    const Text("Enter Your Phone Number", style: TextStyle(fontSize: 13)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: otpProvider.phoneController,
                      focusNode: otpProvider.phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: RichText(
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
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Expanded( // Allows button to adjust within available space
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          buttonText: otpProvider.isLoading ? "Sending..." : "Next",
                          showIcon: true,
                          onTap: () => otpProvider.sendOTP(context),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
