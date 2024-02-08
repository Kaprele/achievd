import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],

          ),
        ),
        toolbarHeight: 160,
        backgroundColor: Colors.red,


      ),
      body: Container(
        child: Center(
          child: Text('Ola'),
        ),
      ),
    );
  }
}
