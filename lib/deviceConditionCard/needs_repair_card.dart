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
        border: Border.all(color: Colors.red.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
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
              Text("😌", style: TextStyle(fontSize: 18)),
            ],
          ),

          const SizedBox(height: 10),

          // Condition Title
          const Text(
            "Needs Repair",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),

          const SizedBox(height: 6),

          // Description
          const Text(
            "Requires repair work\n"
                "May have visible issues or defects\n"
                "Ideal for buyers willing to invest in repairs",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
