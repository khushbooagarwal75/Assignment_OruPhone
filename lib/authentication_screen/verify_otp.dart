import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/provider/otp_provider.dart';
import 'package:provider/provider.dart';
import '../components/custom_button.dart';
import '../components/page_title.dart';

class VerifyOtp extends StatelessWidget {
  final String phone;
  final String verificationId;
  const VerifyOtp({super.key, required this.phone, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OtpProvider>(context);
    final List<TextEditingController> otpControllers =
    List.generate(6, (index) => TextEditingController());
    final List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
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
              pageSubTitle: "Please enter the 6-digit verification code sent to $phone via SMS",
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

            CustomButton(
              buttonText: otpProvider.isLoading ? "Verifying..." : "Verify OTP",
              showIcon: false,
              onTap: () {
                String otp = otpControllers.map((controller) => controller.text).join();
                otpProvider.verifyOtp(otp, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
