import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        backgroundColor:
            const Color(0xFFF83758), // Set the app bar background color
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(50),
                margin: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Info',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Phone Number (+91)'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address Info',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(hintText: 'Pincode'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(hintText: 'City'),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'State'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Locality / Area / Street'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Flat no / Building Name'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Landmark (optional)'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Type of Address',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                        const Text('Home',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        const SizedBox(width: 20),
                        Radio(value: 2, groupValue: 0, onChanged: (value) {}),
                        const Text('Office',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        const SizedBox(width: 20),
                        Radio(value: 3, groupValue: 0, onChanged: (value) {}),
                        const Text('Other',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (bool? value) {}),
                        const Text('Make this my default address',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(6),
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF83758),
              textStyle: const TextStyle(fontFamily: 'Poppins'),
            ),
            child: const Text('Save Address'),
          ),
        ),
      ),
    );
  }
}
