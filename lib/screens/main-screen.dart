import 'package:achievd/screens/welcome-screen.dart';
import 'package:achievd/widgets/custom-scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String route = '/main-screen';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Center(
            child: MaterialButton(
      onPressed: () => { FirebaseAuth.instance.signOut, Navigator.pushReplacementNamed(context, WelcomeScreen.route)},
      child: Text('Sign out'),
    )));
  }
}
