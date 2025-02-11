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
                    _buildFilterSection("Brand", 2),
                    _buildFilterSection("All", 1),
                    _buildFilterSection("Condition", 1),
                    _buildStorageSection(),
                    _buildRamSection(),
                    _buildFilterSection("Verification", 2),
                    _buildFilterSection("Warranty", 2),
                    _buildFilterSection("Price Range", 2),
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
Widget _buildFilterSection(String filterName, int selectedOption) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      filterName,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

// Helper function for Storage selection
Widget _buildStorageSection() {
  List<String> storageOptions = ["4 GB", "6 GB"];
  return _buildSelectionGrid("Storage", storageOptions);
}

// Helper function for RAM selection
Widget _buildRamSection() {
  List<String> ramOptions = ["2 GB", "3 GB", "8 GB", "12 GB", "16 GB"];
  return _buildSelectionGrid("RAM", ramOptions);
}

// Helper function for grid-style selection
Widget _buildSelectionGrid(String title, List<String> options) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: options.map((option) {
          bool isSelected = false; // Replace with actual selection logic
          return GestureDetector(
            onTap: () {
              // Toggle selection logic
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.amber : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.black : Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}
