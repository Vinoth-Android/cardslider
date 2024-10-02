import 'package:flutter/material.dart';

class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  bool _isSecondIconVisible = false; // State to control visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: const Text("Trial")),
      body: Column(
        children: [
          // Custom AppBar Layout
          Container(
            width: double.infinity,
            height: 40.0,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                // Back Button (Icon)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 22.0,
                  onPressed: () {
                    Navigator.pop(context); // Navigate back on button press
                  },
                ),
                const SizedBox(width: 4.0),
                // Title Text
                const Text(
                  "Trail",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),

          // Image Layout
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  // First Icon (Visible)
                  const Center(
                    child: Icon(
                      Icons.image,
                      size: 200, // Fixed size instead of double.infinity
                      color: Colors.green,
                    ),
                  ),
                  // Second Icon (Controlled by visibility state)
                  if (_isSecondIconVisible)
                    const Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 200, // Fixed size instead of double.infinity
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Button to toggle visibility of the second icon
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isSecondIconVisible =
                    !_isSecondIconVisible; // Toggle visibility
              });
            },
            child: const Text('Toggle Second Icon'),
          ),
          const SizedBox(height: 20.0), // Add some bottom padding
        ],
      ),
    );
  }
}
