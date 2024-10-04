import 'package:cardslider/pages/cart.dart';
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) {
                  return const ProductCard(
                    image: 'assets/Vinoth.jpg',
                    productName: 'Bluebell hand block tiered dress',
                    price: '₹1000',
                    oldPrice: '₹1500',
                    reviews: '2k',
                  );
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

  const CustomChip({required this.label, super.key});

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
  final String image;
  final String productName;
  final String price;
  final String oldPrice;
  final String reviews;

  const ProductCard({
    required this.image,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.reviews,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 1.0,
                right: 1.0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear),
                  iconSize: 25.0,
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
                  height: 40.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the Cart page when pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cart()),
                      );
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(
            productName,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontFamily: 'Poppins-SemiBold',
                  fontSize: 13.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5.0),
              Text(
                oldPrice,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.0,
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Text(
                '★',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.orange,
                  height: 1.3,
                ),
              ),
              const SizedBox(width: 1.1),
              Text(
                '( $reviews Reviews )',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13.0,
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
