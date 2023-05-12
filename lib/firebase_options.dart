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
    apiKey: 'AIzaSyC1xYj3E5LSOHBVdjT6P20xtJm9ehFLlv4',
    appId: '1:164839929318:web:b3ca537cf2f7a9a80a9227',
    messagingSenderId: '164839929318',
    projectId: 'divv-chat-app',
    authDomain: 'divv-chat-app.firebaseapp.com',
    storageBucket: 'divv-chat-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7kxs6dbHHbEsTvTyOuE9_CuF4UyMyM6U',
    appId: '1:164839929318:android:b18a65605a05ed070a9227',
    messagingSenderId: '164839929318',
    projectId: 'divv-chat-app',
    storageBucket: 'divv-chat-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZNPhPL3KdnAwwFvDoo2ovDCgbVLYAbfw',
    appId: '1:164839929318:ios:609babe5ec83846e0a9227',
    messagingSenderId: '164839929318',
    projectId: 'divv-chat-app',
    storageBucket: 'divv-chat-app.appspot.com',
    iosClientId: '164839929318-ll2n9km3j3f5kk83angcnbpab1fpa2u3.apps.googleusercontent.com',
    iosBundleId: 'com.example.divv',
  );
}
