import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/account_notFound_bottomSheet.dart';
import 'package:flutter_assignment_oruphones/components/chip_text.dart';
import 'package:flutter_assignment_oruphones/components/login_bottomsheet.dart';
import 'package:flutter_assignment_oruphones/components/product_card.dart';
import 'package:flutter_assignment_oruphones/components/verify_otp_bottmSheet.dart';

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
              onPressed: () {
               showSignUpBottomSheet(context);
              },
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
        child: SingleChildScrollView(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sort Button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent, // White background
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300), // Light grey border
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.import_export, color: Colors.black), // Leading icon
                            SizedBox(width: 6),
                            Text("Sort", style: TextStyle(color: Colors.black, fontSize: 16)),
                            SizedBox(width: 6),
                            Icon(Icons.keyboard_arrow_down, color: Colors.grey), // Trailing icon
                          ],
                        ),
                      ),

                      // Filter Button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent, // White background
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300), // Light grey border
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.black), // Leading icon
                            SizedBox(width: 6),
                            Text("Filter", style: TextStyle(color: Colors.black, fontSize: 16)),
                            SizedBox(width: 6),
                            Icon(Icons.keyboard_arrow_down, color: Colors.grey), // Trailing icon
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  GridView.builder(
                    shrinkWrap: true, // Allows GridView to be inside SingleChildScrollView
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 cards in a row
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7, // Adjust height-to-width ratio
                    ),
                    itemCount: 4, // Change this based on the number of items
                    itemBuilder: (context, index) {
                      return ProductCard(
                        imageUrl: 'assets/images/mobile.png', // Change as needed
                        priceText: 'Price Negotiable',
                        title: 'Apple iphone 13 Pro',
                        description: '12/256 GB .Like New',
                        details: 'RS 415000',
                        location: 'Nagpur',
                        date: 'Feb 11,2025',
                      );
                    },
                  ),



              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
