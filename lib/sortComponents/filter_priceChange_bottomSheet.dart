import 'package:flutter/material.dart';

void showFiltersBottomSheet(BuildContext context) {
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
            // Cross Icon on the top right
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Header Text
            const Text(
              "Filters",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // Filter options with "Amber" for selected
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Filter
                _buildFilterRow("Brand", 2, context),

                // Maximum Price Filter
                _buildFilterRow("Maximum Price", 1, context),

                // Condition Filter
                _buildFilterRow("Condition", 1, context),

                // Storage Filter
                _buildFilterRow("Storage", 2, context),

                // RAM Filter
                _buildFilterRow("RAM", 1, context),

                // Verification Filter
                _buildFilterRow("Verification", 2, context),

                // Warranty Filter
                _buildFilterRow("Warranty", 2, context),

                // Minimum Price
                _buildFilterRow("Minimum Price", 1, context),

                // Price Range
                _buildFilterRow("Price Range", 2, context),
              ],
            ),

            const SizedBox(height: 20),

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

// Helper method to build filter row
Widget _buildFilterRow(String filterName, int selectedOption, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Handle the option selection
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedOption == 1 ? Colors.amber : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: selectedOption == 1 ? Colors.black : Colors.black.withOpacity(0.6),
          ),
        ),
      ),
    ),
  );
}
