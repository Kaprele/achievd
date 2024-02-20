// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBp0DIpys0hNf1IkjX15ndg4rRz8c5lXP4',
    appId: '1:14876649997:web:acd7723541d7b6d11cc344',
    messagingSenderId: '14876649997',
    projectId: 'achievd-711a5',
    authDomain: 'achievd-711a5.firebaseapp.com',
    storageBucket: 'achievd-711a5.appspot.com',
    measurementId: 'G-435Z1MJ3Z8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC21NQPKf-YJZvAKvRZkQNNTCz81c0lFRk',
    appId: '1:14876649997:android:a559d34f1c3efbc91cc344',
    messagingSenderId: '14876649997',
    projectId: 'achievd-711a5',
    storageBucket: 'achievd-711a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANyDOEOn-oNnzE_yTQFnYFP-BLoK9GNaU',
    appId: '1:14876649997:ios:3e93d5fe6a3a0d6f1cc344',
    messagingSenderId: '14876649997',
    projectId: 'achievd-711a5',
    storageBucket: 'achievd-711a5.appspot.com',
    iosBundleId: 'com.example.achievd',
  );
}