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

            // Searchable Brand List
            _buildSearchableFilterSection("Brand", ["All Brands", "Apple", "Samsung", "Google", "OnePlus", "Xiaomi"]),
            _buildFilterSection("Condition", 2),
            _buildFilterSection("Storage", 2),
            _buildFilterSection("RAM", 2),
            _buildFilterSection("Verification", 2),
            _buildFilterSection("Warranty", 2),
            _buildFilterSection("Price Range", 2),

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

// Searchable Brand Section
Widget _buildSearchableFilterSection(String title, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          hintText: "Search here",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
      const SizedBox(height: 10),
      Wrap(
        spacing: 8,
        children: options.map((brand) {
          return ChoiceChip(
            label: Text(brand),
            selected: false, // Replace with state management
            selectedColor: Colors.amber,
            backgroundColor: Colors.grey.shade200,
            onSelected: (selected) {
              // Handle selection logic
            },
          );
        }).toList(),
      ),
      const SizedBox(height: 10),
    ],
  );
}

// Helper function for filter row
Widget _buildFilterSection(String title, int count) {
  return ListTile(
    title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
