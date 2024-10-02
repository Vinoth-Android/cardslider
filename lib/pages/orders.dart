import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Appbar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplayBold',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Product card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
                    SizedBox(
                      width: 120,
                      height: 140,
                      child: Image.network(
                        "https://i.pinimg.com/564x/03/bd/9e/03bd9e110cfa2e3a5c12ab0ee81d966e.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Product details
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product name
                          Text(
                            'Item Title',
                            style: TextStyle(
                              fontFamily: 'PoppinsSemiBold',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          SizedBox(height: 8),

                          // Price and offer
                          Row(
                            children: [
                              Text(
                                '₹1000',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '₹1000',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    'Qty:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 8),

                          // Delivery status
                          Text(
                            'In Delivery',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xFF0EA714),
                            ),
                          ),

                          SizedBox(height: 8),

                          // Offer percentage
                          Text(
                            '40% off',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),

              // Overall rating label
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Overall Rating',
                  style: TextStyle(
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
