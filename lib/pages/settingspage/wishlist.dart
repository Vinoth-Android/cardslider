import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 80),

          // AppBar Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                ),
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
                          '₹8000',
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

          // GridView of Product Cards
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Still 2 items per row
                  mainAxisSpacing: 10, // Increased vertical space between cards
                  crossAxisSpacing:
                      10, // Increased horizontal space between cards
                  childAspectRatio:
                      0.55, // Adjusted ratio to fit larger content
                ),
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
                itemCount: 50,
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

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0), // Increased padding for more space
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10), // Added border radius for rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center Image
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250.0, // Increased image height to make the card larger
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/Vinoth.jpg'),
                    fit: BoxFit.cover, // Keeps image cover
                  ),
                ),
              ),
              Positioned(
                top: 1.0,
                right: 1.0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear),
                  iconSize: 25.0, // Larger icon for better usability
                  padding: const EdgeInsets.all(8.0),
                  constraints: const BoxConstraints(),
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 15.0,
                left: 30.0,
                right: 30.0,
                child: SizedBox(
                  width: 30.0,
                  height: 40.0, // Larger button height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0, // Increased font size for button text
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 15.0), // Increased space between image and text
          // Product Name
          const Text(
            'Bluebell hand block tiered dress',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15.0, // Larger font size for product name
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0), // Space between product name and price
          // Price Row
          const Row(
            children: [
              Text(
                '₹1000',
                style: TextStyle(
                  fontFamily: 'Poppins-SemiBold',
                  fontSize: 13.0, // Larger font size for the price
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                '₹1500',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.0, // Larger font size for original price
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0), // Space between price and star reviews
          // Star Reviews Row
          const Row(
            children: [
              Text(
                '★',
                style: TextStyle(
                  fontSize: 12.0, // Larger star icon size
                  color: Colors.orange,
                  height: 1.3,
                ),
              ),
              SizedBox(width: 1.1),
              Text(
                '( 2k Reviews )',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.0, // Slightly larger review text size
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
