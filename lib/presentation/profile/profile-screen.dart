import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          Container(
          height: 80,
          width: 80,
          // margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
        ),

          Column(),
          Container(
            padding: const EdgeInsets.all(5),
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
              ],
            ),
          ),
        ],
        toolbarHeight: 100,
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
