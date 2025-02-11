import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';

void showSignUpBottomSheet(BuildContext context) {
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
              // Title
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign Up to continue",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
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

              const SizedBox(height: 20),

              // Label
              const Text(
                "Please Tell Us Your Name *",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 10),

              // Name Field
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),

              const SizedBox(height: 15),

              // Custom Button
              const CustomButton(buttonText: "Confirm Name", showIcon: true),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
