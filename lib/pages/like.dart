import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Like extends StatelessWidget {
  const Like({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Like',
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
                        'Items',
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
                      label:
                          Text('All', style: TextStyle(fontFamily: 'Poppins')),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    SizedBox(width: 10.0),
                    Chip(
                      label: Text('Child',
                          style: TextStyle(fontFamily: 'Poppins')),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    SizedBox(width: 10.0),
                    Chip(
                      label: Text('Women',
                          style: TextStyle(fontFamily: 'Poppins')),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    SizedBox(width: 10.0),
                    Chip(
                      label:
                          Text('Men', style: TextStyle(fontFamily: 'Poppins')),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    SizedBox(width: 10.0),
                    Chip(
                      label: Text('Others',
                          style: TextStyle(fontFamily: 'Poppins')),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: ListView.builder(
                  itemCount: 25, // 25 rows, each with 2 items
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Left side item
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 250.0,
                          margin: const EdgeInsets.all(5.0),
                          color: Colors.grey,
                        ),
                        // Right side item
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 250.0,
                          margin: const EdgeInsets.all(5.0),
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
