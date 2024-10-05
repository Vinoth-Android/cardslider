import 'package:cardslider/pages/coupons.dart';
import 'package:cardslider/pages/orders.dart';
import 'package:cardslider/pages/settingspage/chatbot.dart';
import 'package:cardslider/pages/settingspage/pages/address.dart';
import 'package:cardslider/pages/settingspage/pages/editprofile.dart';
import 'package:cardslider/pages/settingspage/pages/loginpage.dart';
import 'package:cardslider/pages/settingspage/pages/notificationsettings.dart';
import 'package:cardslider/pages/settingspage/wishlist.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isAccountSettingsExpanded = false;
  bool _isMyActivityExpanded = false;
  bool _isEarnWithAIEcomExpanded = false;
  bool _isFeedbackInformationExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildGridBox(),
              const SizedBox(height: 20),
              _buildExpandableSection(
                title: "Profile Settings",
                isExpanded: _isAccountSettingsExpanded,
                onTap: () {
                  setState(() {
                    _isAccountSettingsExpanded = !_isAccountSettingsExpanded;
                  });
                },
                children: _buildAccountSettingsContent(),
              ),
              _buildExpandableSection(
                title: "My Activity",
                isExpanded: _isMyActivityExpanded,
                onTap: () {
                  setState(() {
                    _isMyActivityExpanded = !_isMyActivityExpanded;
                  });
                },
                children: _buildMyActivityContent(),
              ),
              _buildExpandableSection(
                title: "Earn With AIEcom",
                isExpanded: _isEarnWithAIEcomExpanded,
                onTap: () {
                  setState(() {
                    _isEarnWithAIEcomExpanded = !_isEarnWithAIEcomExpanded;
                  });
                },
                children: _buildEarnWithAIEcomContent(),
              ),
              _buildExpandableSection(
                title: "Feedback & Information",
                isExpanded: _isFeedbackInformationExpanded,
                onTap: () {
                  setState(() {
                    _isFeedbackInformationExpanded =
                        !_isFeedbackInformationExpanded;
                  });
                },
                children: _buildFeedbackInformationContent(),
              ),
              const SizedBox(height: 20),
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/img.jpg'),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey Vinoth',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Explore'),
                SizedBox(width: 4),
                Icon(Icons.star, size: 16, color: Colors.blue),
                Text(
                  'Plus',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text(
              '40',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 4),
            Icon(Icons.bolt, color: Colors.amber),
          ],
        ),
      ],
    );
  }

  Widget _buildGridBox() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      children: [
        _buildGridItem(Icons.shopping_bag, 'Orders', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderDetailsPage()),
          );
        }),
        _buildGridItem(Icons.favorite, 'Wishlist', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WishlistPage()),
          );
        }),
        _buildGridItem(Icons.local_offer, 'Coupons', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CouponsScreen()),
          );
        }),
        _buildGridItem(Icons.headset_mic, 'Help Center', onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatBotScreen()),
          );
        }),
      ],
    );
  }

  Widget _buildGridItem(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // Handle the onTap event
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 20)),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          onTap: onTap,
        ),
        if (isExpanded) ...children,
      ],
    );
  }

  List<Widget> _buildAccountSettingsContent() {
    return [
      _buildSettingsItem(Icons.star, 'AIEcom Plus'),
      _buildSettingsItem(Icons.person, 'Edit Profile', onTap: () {
        // Navigate to EditProfileScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfileScreen()),
        );
      }),
      _buildSettingsItem(Icons.location_on, 'Saved Address', onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddressPage()),
        );
      }),
      _buildSettingsItem(Icons.language, 'Select Language'),
      _buildSettingsItem(Icons.notifications, 'Notification Settings',
          onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NotificationSettingsScreen()),
        );
      }),
    ];
  }

  List<Widget> _buildMyActivityContent() {
    return [
      _buildSettingsItem(Icons.rate_review, 'Reviews'),
      _buildSettingsItem(Icons.question_answer, 'Questions / Answers'),
    ];
  }

  List<Widget> _buildEarnWithAIEcomContent() {
    return [
      _buildSettingsItem(Icons.store, 'Sell on AIEcom'),
    ];
  }

  List<Widget> _buildFeedbackInformationContent() {
    return [
      _buildSettingsItem(Icons.assignment, 'Terms & Conditions'),
      _buildSettingsItem(Icons.privacy_tip, 'Privacy Policy'),
      _buildSettingsItem(Icons.feedback, 'Feedback'),
    ];
  }

  Widget _buildSettingsItem(IconData icon, String label,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap ?? () {},
    );
  }

  Widget _buildBottomButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Logout'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const LoginPage()), // Navigate to LoginPage
            );
          },
          child: const Text('Login'),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Add Account',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
