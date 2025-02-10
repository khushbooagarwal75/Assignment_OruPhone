import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String pageTitle;
  final String pageSubTitle;
  const PageTitle({super.key, required this.pageTitle, required this.pageSubTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            pageTitle,
            style: TextStyle(
              color: Colors.indigo.shade900,
              fontSize: 33,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            pageSubTitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),

      ],
    );
  }
}
