import 'package:cardslider/pages/cardswip.dart';
import 'package:cardslider/pages/cart.dart';
import 'package:cardslider/pages/settingspage/settings.dart';
import 'package:cardslider/pages/like.dart';
import 'package:cardslider/pages/trial.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Settings(),
    const Like(),
    const Cart(),
    const Trial(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Cardswip();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen = const Cardswip(); // Navigate to Cardswip page
            currentTab = 4; // Update tab index if needed
          });
        },
        backgroundColor: Colors.lightBlue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: const Icon(Icons.home), // FAB icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 3,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align items to the start
            children: <Widget>[
              buildNavItem(Icons.settings, "Settings", 0, () {
                setState(() {
                  currentScreen = const Settings();
                  currentTab = 0;
                });
              }),
              const SizedBox(width: 0), // Adjust space between items
              buildNavItem(Icons.thumb_up, "Like", 1, () {
                setState(() {
                  currentScreen = const Like();
                  currentTab = 1;
                });
              }),
              const Spacer(), // Add spacer to push other items to the right
              buildNavItem(Icons.card_travel, "Cart", 2, () {
                setState(() {
                  currentScreen = const Cart();
                  currentTab = 2;
                });
              }),
              buildNavItem(Icons.star, "Trial", 3, () {
                setState(() {
                  currentScreen = const Trial();
                  currentTab = 3;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(
      IconData icon, String label, int tabIndex, VoidCallback onTap) {
    return MaterialButton(
      minWidth: 90,
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == tabIndex ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentTab == tabIndex ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
