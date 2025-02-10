import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/chip_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Image.asset(
            "assets/images/logo.png",
            width: 50,
            height: 20,
          ),
          Spacer(),
          Text("India "),
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
          SizedBox(
            width: 10,
          ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search phones with make,model...",
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
                // Left-side Search Icon
                prefixIcon: Icon(Icons.search, color: Colors.orange),

                // Right-side Mic Icon
                suffixIcon: Icon(Icons.mic, color: Colors.grey),

                // Border with Grey Color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  borderSide: BorderSide(color: Colors.grey), // Grey border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: Colors.black), // Darker when focused
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              child: Row(
                children: [
                  ChipText(),
                ],
              ),
            ),
            Image.asset("assets/images/PhoneBanners.png"),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What's on your mind?",
                style: TextStyle(
                  fontSize: 22
                ),),
                SizedBox(height: 20,),

              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Top brands",
                      style: TextStyle(
                          fontSize: 22
                      ),),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          
                        }, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                SizedBox(height: 20,),

              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'Best deals ',
                        style: TextStyle(
                          fontSize: 22,
                        ),),
                      TextSpan(
                        text: 'in India',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 22,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Chip(

                      label: Text(
                        "Sort",
                        style: TextStyle(color: Colors.black), // Customize text color
                      ),
                      // Light grey background
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Padding
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
