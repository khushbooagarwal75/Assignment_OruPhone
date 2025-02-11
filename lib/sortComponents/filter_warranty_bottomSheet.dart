import 'package:flutter/material.dart';

void showFiltersBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
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

            // Filters List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFilterRow("Location", 2),
                    _buildFilterRow("Distance", 1),
                    _buildFilterRow("Brand", 2),
                    _buildFilterRow("All", 1),
                    _buildFilterRow("Condition", 1),
                    _buildFilterRow("Brand Warranty", 2),
                    _buildFilterRow("Seller Warranty", 2),
                    _buildFilterRow("Storage", 2),
                    _buildFilterRow("RAM", 1),
                    _buildFilterRow("Verification", 2),
                    _buildFilterRow("Warranty", 2),
                    _buildFilterRow("Price Range", 2),
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
Widget _buildFilterRow(String filterName, int selectedOption) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      padding: const EdgeInsets.all(12),
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
  );
}
