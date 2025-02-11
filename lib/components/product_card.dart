import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String priceText;
  final String title;
  final String description;
  final String details;
  final String location;
  final String date;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.priceText,
    required this.title,
    required this.description,
    required this.details,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Prevent unnecessary expansion
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            imageUrl,
            height: 100, // Fixed height for image
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Center(
            child: Text(
              priceText,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                details,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text(
                "$location • $date",
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        // Wrap this in `Expanded` if you want it to take the remaining space
        
      ],
    );

  }
}
