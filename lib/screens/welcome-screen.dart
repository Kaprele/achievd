import 'package:achievd/screens/registration-flow.dart';
import 'package:achievd/widgets/custom-scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/full-width-button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome-screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Center(child: Text('achieved')),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'TODO',
                style: TextStyle(
                    fontSize: 48,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/login-flow'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text('I\'ve already got an account'),
            ),
          ),
          FullWidthButton(
              text: 'Get started!',
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationFlow.route)),
        ],
      ),
    );
  }
}
