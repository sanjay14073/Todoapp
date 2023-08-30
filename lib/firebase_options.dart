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
        return macos;
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
    apiKey: 'AIzaSyCDa5fY8od9ffRDs8Ty2vazS63CityLHy8',
    appId: '1:993253124629:web:9a6d3906c160c56e60bc1c',
    messagingSenderId: '993253124629',
    projectId: 'todo-e9f62',
    authDomain: 'todo-e9f62.firebaseapp.com',
    storageBucket: 'todo-e9f62.appspot.com',
    measurementId: 'G-P7J3Y8NFRJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZwHLNdy3mS8TInbLsrzS7Lx0fBSrNDYs',
    appId: '1:993253124629:android:784b7283ba9fb41060bc1c',
    messagingSenderId: '993253124629',
    projectId: 'todo-e9f62',
    storageBucket: 'todo-e9f62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgjTWGRBOlsY-IAgHxTXcHcA6yKb4SVBA',
    appId: '1:993253124629:ios:8939fa83cfc5491f60bc1c',
    messagingSenderId: '993253124629',
    projectId: 'todo-e9f62',
    storageBucket: 'todo-e9f62.appspot.com',
    iosClientId: '993253124629-81o7lt6l172kd50e4ard9o8e0u5avhk1.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgjTWGRBOlsY-IAgHxTXcHcA6yKb4SVBA',
    appId: '1:993253124629:ios:8939fa83cfc5491f60bc1c',
    messagingSenderId: '993253124629',
    projectId: 'todo-e9f62',
    storageBucket: 'todo-e9f62.appspot.com',
    iosClientId: '993253124629-81o7lt6l172kd50e4ard9o8e0u5avhk1.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoapp',
  );
}