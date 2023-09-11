import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, this.appBar, required this.body, this.floatingActionButton});

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(padding: const EdgeInsets.all(16), child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}