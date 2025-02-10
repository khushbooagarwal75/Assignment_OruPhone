import 'package:flutter/material.dart';
import 'package:flutter_assignment_oruphones/components/image_card.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImagewithTextCard(imagePath: "assets/images/buy.png", text: "How to Buy"),
            ImagewithTextCard(imagePath: "assets/images/sell.png", text: "How to Sell"),
            ImagewithTextCard(imagePath: "assets/images/ourGuide.png", text: "Our Guide")
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImagewithTextCard(imagePath: "assets/images/AboutUs.png", text: "About Us"),
            ImagewithTextCard(imagePath: "assets/images/PrivacyPolicy.png", text: "Privacy Policy"),
            ImagewithTextCard(imagePath: "assets/images/FAQ.png", text: "FAQs")
          ],
        ),
      ],
    );
  }
}
