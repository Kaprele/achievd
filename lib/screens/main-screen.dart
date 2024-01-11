import 'package:achievd/screens/welcome-screen.dart';
import 'package:achievd/widgets/custom-scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String route = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }
  
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
