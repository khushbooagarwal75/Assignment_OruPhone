import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/landing_page_button.dart';
import 'package:flutter_assignment_oruphones/components/menu_card.dart';

class MobileLoggedinMode extends StatelessWidget {
  const MobileLoggedinMode({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          leading: Image.asset("assets/images/logo.png"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.xmark,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Rounded corners for the image
                      child: Image.asset(
                        'assets/images/logo.png', // Replace with actual image URL
                        height: 60, // Adjust height
                        width: 60, // Adjust width
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      "John Doe", // Replace with actual name
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "This is a sample description text.", // Replace with actual text
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: 30),
          
              LandingPageButton(
                color: Colors.amber.shade600,
                buttonText: "Sell Your Phone",
                textColor: Colors.black, onPressed: () {  },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox( width: 20,),
                    Text("Logout")
                  ],
                ),
              ),
              Spacer(),
              MenuCard(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
