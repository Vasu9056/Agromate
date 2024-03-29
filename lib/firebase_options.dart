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
    apiKey: 'AIzaSyAnyDqfFfIeQWBWLL5khnCdBsuAlh3f_S4',
    appId: '1:20187006733:web:a26c0cb1f4c0c6dc1f5244',
    messagingSenderId: '20187006733',
    projectId: 'agromate-c4f66',
    authDomain: 'agromate-c4f66.firebaseapp.com',
    storageBucket: 'agromate-c4f66.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFgWPscoYYXWcYXiKPYIbyPxx6t4YT4mM',
    appId: '1:20187006733:android:a11dd21935e491741f5244',
    messagingSenderId: '20187006733',
    projectId: 'agromate-c4f66',
    storageBucket: 'agromate-c4f66.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDErwfsN3t4GY255n3yWXlK_MqKhjLUgbA',
    appId: '1:20187006733:ios:185bf6c76e41e8a71f5244',
    messagingSenderId: '20187006733',
    projectId: 'agromate-c4f66',
    storageBucket: 'agromate-c4f66.appspot.com',
    iosBundleId: 'com.example.agromate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDErwfsN3t4GY255n3yWXlK_MqKhjLUgbA',
    appId: '1:20187006733:ios:1b10bc07924ea27f1f5244',
    messagingSenderId: '20187006733',
    projectId: 'agromate-c4f66',
    storageBucket: 'agromate-c4f66.appspot.com',
    iosBundleId: 'com.example.agromate.RunnerTests',
  );
}
