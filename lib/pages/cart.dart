import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<int> productQuantities = List.generate(30, (index) => 1);

  void _increaseQuantity(int index) {
    setState(() {
      productQuantities[index]++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (productQuantities[index] > 1) {
        productQuantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Cart")),
      body: Column(
        children: [
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '8',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      'Items',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Total : ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '₹1000',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 50.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chip(
                    label: Text('All', style: TextStyle(fontFamily: 'Poppins')),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label:
                        Text('Child', style: TextStyle(fontFamily: 'Poppins')),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label:
                        Text('Women', style: TextStyle(fontFamily: 'Poppins')),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label: Text('Men', style: TextStyle(fontFamily: 'Poppins')),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label:
                        Text('Others', style: TextStyle(fontFamily: 'Poppins')),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const Icon(Icons.image, size: 50),
                      ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Product Name',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5.0),
                            const Row(
                              children: [
                                Text(
                                  '₹1000',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  '₹1200',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            const Text(
                              'FREE DELIVERY',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.green,
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => _decreaseQuantity(index),
                                ),
                                Text(
                                  '${productQuantities[index]}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () => _increaseQuantity(index),
                                ),
                                const Spacer(),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  label: const Text(
                                    'Remove',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
