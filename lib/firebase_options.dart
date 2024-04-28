// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyArsVfiU9ATQ6o67ZxtXpNJqqe0jl1L4uM',
    appId: '1:888943015918:web:d9a2d915c15aebbe7cc0ff',
    messagingSenderId: '888943015918',
    projectId: 'user-1d6e1',
    authDomain: 'user-1d6e1.firebaseapp.com',
    storageBucket: 'user-1d6e1.appspot.com',
    measurementId: 'G-YLNF1H5GLY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3TFgJaxksCLHfMZRgJV1yiq_SQiKqICE',
    appId: '1:888943015918:android:0e725bd926f24a677cc0ff',
    messagingSenderId: '888943015918',
    projectId: 'user-1d6e1',
    storageBucket: 'user-1d6e1.appspot.com',
  );
}