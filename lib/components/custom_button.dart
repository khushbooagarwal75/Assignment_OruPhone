import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool showIcon;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.buttonText, required this.showIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo, // Indigo background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Lesser circular radius
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
            if(showIcon)...[
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_outlined, color: Colors.white),
            ]

          ],
        ),
      ),
    );
  }
}
