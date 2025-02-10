import 'package:flutter/material.dart';
class LandingPageButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  const LandingPageButton({super.key, required this.color, required this.buttonText, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Indigo background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Lesser circular radius
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {},
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,fontSize: 16),
          ),
        ),
      ),
    );
  }
}
