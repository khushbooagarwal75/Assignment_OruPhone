import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  const ChipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          label: Text(
            "Sell Used Phones",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "Buy Used Phones",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "Compare Prices",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "My Profile",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),SizedBox(width: 2,),
        Chip(
          label: Text(
            "My Listings",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "Services",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "Register your Store",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),
        SizedBox(width: 2,),
        Chip(
          label: Text(
            "Get the App",
            style: TextStyle(color: Colors.black), // Customize text color
          ),
          // Light grey background
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
        ),

      ],
    );
  }
}
