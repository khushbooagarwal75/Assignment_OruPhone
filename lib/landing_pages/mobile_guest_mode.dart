import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/custom_button.dart';
import 'package:flutter_assignment_oruphones/components/image_card.dart';
import 'package:flutter_assignment_oruphones/components/landing_page_button.dart';
import 'package:flutter_assignment_oruphones/components/menu_card.dart';

class MobileGuestMode extends StatelessWidget {
  const MobileGuestMode({super.key});

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
              icon: const Icon(CupertinoIcons.xmark,color: Colors.black,size: 24,),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
          LandingPageButton(
              color: Colors.indigo,
              buttonText: "Login/SignUp", textColor: Colors.white,),
            SizedBox(
              height: 10,
            ),
            LandingPageButton(
              color: Colors.amber.shade600,
              buttonText: "Sell Your Phone", textColor: Colors.black,),
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
