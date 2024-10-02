import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 0),

              // Profile Picture Section (center-aligned)
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Profile Picture
                      Container(
                        width: 170,
                        height: 170,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/img.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Change Profile Picture Icon
                      Positioned(
                        bottom: 16,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            // Handle change profile picture action
                          },
                          child: Container(
                            width: 30,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.photo_camera,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // First Name
              _buildInputField("Name", "First Name", TextInputType.text),

              // Email
              _buildInputField("Email", "Email ID", TextInputType.emailAddress),

              // Mobile Number
              _buildInputField("Mobile No", "Mobile No", TextInputType.phone),

              // Date of Birth
              _buildInputField(
                  "Date of Birth", "dd/mm/yyyy", TextInputType.datetime),

              // Address
              _buildInputField(
                  "Address", "House No, Street Name", TextInputType.multiline),

              // Area/City
              _buildInputField(
                  "Area/City", "Area/City Name", TextInputType.text),

              // State/Pincode
              _buildInputField(
                  "State/Pincode", "State Pincode", TextInputType.text),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
