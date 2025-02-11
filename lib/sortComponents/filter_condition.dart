import 'package:flutter/material.dart';

void showFiltersBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Bar with Title and Close Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filters",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),

            // Filter Options List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFilterSection("Brand", "All", 2),
                    _buildFilterSection("All Conditions", "", 1),
                    _buildConditionOptions(), // Conditions as separate chips
                    _buildFilterSection("Storage", "", 2),
                    _buildFilterSection("RAM", "", 2),
                    _buildFilterSection("Verification", "", 2),
                    _buildFilterSection("Warranty", "", 2),
                    _buildFilterSection("Price Range", "", 2),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Clear filters logic
                    },
                    child: const Text("Clear All", style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Apply filters logic
                    },
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

// Helper function for filter row
Widget _buildFilterSection(String title, String subtitle, int count) {
  return ListTile(
    title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(color: Colors.grey)) : null,
    trailing: CircleAvatar(
      backgroundColor: Colors.amber,
      radius: 12,
      child: Text("$count", style: const TextStyle(color: Colors.black, fontSize: 12)),
    ),
    onTap: () {
      // Open respective filter screen
    },
  );
}

// Conditions as selectable chips
Widget _buildConditionOptions() {
  final List<String> conditions = [
    "Like New", "Excellent", "Good", "Fair", "Needs Repair"
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Wrap(
      spacing: 8,
      children: conditions.map((condition) {
        return ChoiceChip(
          label: Text(condition),
          selected: false, // Replace with state management
          selectedColor: Colors.amber,
          backgroundColor: Colors.grey.shade200,
          onSelected: (selected) {
            // Handle selection logic
          },
        );
      }).toList(),
    ),
  );
}
