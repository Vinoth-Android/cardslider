import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Status bar background
      body: Column(
        children: [
          // AppBar Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wishlist',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '8',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Items',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Total :',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Items',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.search, color: Colors.black)
              ],
            ),
          ),

          // Chip Group Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomChip(label: 'All'),
                  CustomChip(label: 'Child'),
                  CustomChip(label: 'Women'),
                  CustomChip(label: 'Men'),
                  CustomChip(label: 'Others'),
                ],
              ),
            ),
          ),

          // Shimmer Frame and RecyclerView (List)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Similar to spanCount="2"
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return const ShimmerWidget(); // Placeholder for your shimmer effect
                },
                itemCount: 8, // Number of items in the grid
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        selected: false,
        onSelected: (bool selected) {},
        backgroundColor: Colors.grey[300],
        selectedColor: Colors.blueAccent,
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(
          Icons.image,
          size: 50,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
