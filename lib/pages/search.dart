import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 90.0),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            height: 80.0,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Product ex: Shirt',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          // ListView for search results
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: 10, // Adjust this dynamically
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Product $index'),
                  subtitle: Text('Product description $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
