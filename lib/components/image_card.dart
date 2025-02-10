import 'package:flutter/material.dart';

class ImagewithTextCard extends StatelessWidget {
  final String imagePath;
  final String text;

  const ImagewithTextCard({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(color: Colors.grey, width: 1), // Grey border
      ),
      padding: EdgeInsets.symmetric(horizontal: 12), // Internal padding
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover), // Image
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
