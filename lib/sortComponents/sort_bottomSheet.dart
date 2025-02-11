import 'package:flutter/material.dart';

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            const Text(
              "Sort",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // Sort Options
            ...[
              "Value For Money",
              "Price: High To Low",
              "Price: Low To High",
              "Latest",
              "Distance",
            ].map((text) => ListTile(
              title: Text(text, style: const TextStyle(fontSize: 16)),
              trailing: Radio(
                value: text,
                groupValue: "Value For Money", // Set the selected value dynamically
                onChanged: (value) {},
              ),
              onTap: () {}, // Handle selection
            )),

            const SizedBox(height: 10),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Clear", style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Apply"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
