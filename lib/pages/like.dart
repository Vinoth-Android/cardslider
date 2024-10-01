import 'package:flutter/material.dart';

class Like extends StatefulWidget {
  const Like({Key? key});

  @override
  LikeState createState() => LikeState();
}

class LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Example')),
      body: Center(
        child: Image.asset('assets/images/img2.jpg'),
      ),
    );
  }
}
