import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 248, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 248, 252),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an Account',
              style: TextStyle(
                fontFamily: 'PlayfairDisplayBold',
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 18.0),
            const TextFieldContainer(
              hintText: 'Email',
              icon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
            ),
            const TextFieldContainer(
              hintText: 'Phone Number',
              icon: Icons.phone,
              inputType: TextInputType.phone,
              maxLength: 10,
            ),
            const TextFieldContainer(
              hintText: 'Gender',
              icon: Icons.person_outline,
            ),
            const PasswordFieldContainer(
              hintText: 'Password',
              icon: Icons.lock,
            ),
            const PasswordFieldContainer(
              hintText: 'Confirm Password',
              icon: Icons.lock_outline,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Email or Phone Number Already Exist',
              style: TextStyle(
                fontSize: 11,
                color: Colors.red,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10.0),
            MaterialButton(
              onPressed: () {},
              color: const Color(0xFF242038),
              textColor: Colors.white,
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              minWidth: double.infinity,
              height: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 2.0),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9067C6),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final int? maxLength;

  const TextFieldContainer({
    required this.hintText,
    required this.icon,
    this.inputType = TextInputType.text,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        keyboardType: inputType,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class PasswordFieldContainer extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const PasswordFieldContainer({
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
          prefixIcon: Icon(icon, color: Colors.black),
          suffixIcon: const Icon(Icons.visibility, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
