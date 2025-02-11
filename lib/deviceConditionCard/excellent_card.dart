import 'package:flutter/material.dart';

class DeviceConditionCard extends StatelessWidget {
  const DeviceConditionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Emoji
          Row(
            children: [
              const Text(
                "Current Device",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text("🥰", style: TextStyle(fontSize: 18)),
            ],
          ),

          const SizedBox(height: 10),

          // Condition Title
          const Text(
            "Excellent",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),

          const SizedBox(height: 6),

          // Description
          const Text(
            "Near-perfect condition with minimal wear\n"
                "Functions flawlessly\n"
                "Well-maintained and looks almost new",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
