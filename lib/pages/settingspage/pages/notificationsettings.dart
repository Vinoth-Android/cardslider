import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.purple, // Set the app bar color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Notification Text and Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Allow all the notifications for this application',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: true, // Set the initial value for the switch
                  onChanged: (bool value) {
                    // Handle switch state change
                  },
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationSettingsScreen(),
  ));
}
