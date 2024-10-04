import 'package:flutter/material.dart';

class CouponsCard extends StatelessWidget {
  final String token;
  final String amount;
  final String firstPurchase;
  final String discountDetails;

  const CouponsCard({
    Key? key,
    required this.token,
    required this.amount,
    required this.firstPurchase,
    required this.discountDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF18123B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      token,
                      style: const TextStyle(
                        fontFamily: 'Poppins-SemiBold',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.white70,
                  thickness: 1.5,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.card_giftcard,
                      color: Colors.purpleAccent,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      firstPurchase,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    discountDetails,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8A56AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                    ),
                    child: const Text(
                      'Buy',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: ClipOval(
            child: Container(
              color: Colors.white,
              width: 30,
              height: 10,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: ClipOval(
            child: Container(
              color: Colors.white,
              width: 30,
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class CouponsList extends StatelessWidget {
  CouponsList({super.key});
  final List<Map<String, String>> coupons = [
    {
      'token': 'Token (10)',
      'amount': 'Amount : ₹100',
      'firstPurchase': 'First Purchase',
      'discountDetails': '5% off for your next order',
    },
    {
      'token': 'Token (10)',
      'amount': 'Amount : ₹100',
      'firstPurchase': 'First Purchase',
      'discountDetails': '5% off for your next order',
    },
    {
      'token': 'Token (10)',
      'amount': 'Amount : ₹100',
      'firstPurchase': 'First Purchase',
      'discountDetails': '5% off for your next order',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        final coupon = coupons[index];
        return CouponsCard(
          token: coupon['token']!,
          amount: coupon['amount']!,
          firstPurchase: coupon['firstPurchase']!,
          discountDetails: coupon['discountDetails']!,
        );
      },
    );
  }
}

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coupon Page",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Poppins', fontSize: 18)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: CouponsList(),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: CouponsScreen(),
    ),
  );
}
