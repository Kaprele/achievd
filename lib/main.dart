import 'package:achievd/presentation/login/login-flow.dart';
import 'package:achievd/presentation/home/main-screen.dart';
import 'package:achievd/presentation/registration/registration-flow.dart';
import 'package:achievd/presentation/welcome/welcome-screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'util/integrations/firebase_options.dart';

void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
            fontFamily: GoogleFonts.firaSans().fontFamily,
          ),
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? '/welcome-screen'
              : '/main-screen',
          routes: <String, WidgetBuilder>{
            WelcomeScreen.route: (BuildContext context) =>
                const WelcomeScreen(),
            LoginFlow.route: (BuildContext context) => const LoginFlow(),
            RegistrationFlow.route: (BuildContext context) =>
                const RegistrationFlow(),
            MainScreen.route: (BuildContext context) => const MainScreen(),
          });
    });
  }
}
