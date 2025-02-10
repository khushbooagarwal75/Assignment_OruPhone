import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/image_card.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          'https://via.placeholder.com/150', // Replace with actual image URL
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "John Doe", // Replace with actual name
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "This is a sample description text.", // Replace with actual text
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),

            ////a
            SizedBox(
              height: 10,
            ),
            LandingPageButton(
              color: Colors.indigo,
              buttonText: "Login/SignUp",
              textColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            LandingPageButton(
              color: Colors.amber.shade600,
              buttonText: "Sell Your Phone",
              textColor: Colors.black,
            ),
            Spacer(),
            MenuCard(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
