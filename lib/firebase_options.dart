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
    apiKey: 'AIzaSyBtdaKU_Dx8G8SE45idTYXYzVwyR4lJz8M',
    appId: '1:805509059020:web:98bf6b0d6e6fde3f018d69',
    messagingSenderId: '805509059020',
    projectId: 'brew-crew-8eeea',
    authDomain: 'brew-crew-8eeea.firebaseapp.com',
    storageBucket: 'brew-crew-8eeea.appspot.com',
    measurementId: 'G-VNJ7S7R9CP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjcROOBZDl6q65kIWrH0vOBuFT1NuTSAg',
    appId: '1:805509059020:android:8bde2d0ee9be6475018d69',
    messagingSenderId: '805509059020',
    projectId: 'brew-crew-8eeea',
    storageBucket: 'brew-crew-8eeea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA603eyzTtmysNErUhC7o82onKKvEP_zYc',
    appId: '1:805509059020:ios:13d0ef0818526ed3018d69',
    messagingSenderId: '805509059020',
    projectId: 'brew-crew-8eeea',
    storageBucket: 'brew-crew-8eeea.appspot.com',
    iosClientId: '805509059020-nrm8k98ifs6raoc8t5ubssg2qnutfca1.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA603eyzTtmysNErUhC7o82onKKvEP_zYc',
    appId: '1:805509059020:ios:13d0ef0818526ed3018d69',
    messagingSenderId: '805509059020',
    projectId: 'brew-crew-8eeea',
    storageBucket: 'brew-crew-8eeea.appspot.com',
    iosClientId: '805509059020-nrm8k98ifs6raoc8t5ubssg2qnutfca1.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled6',
  );
}
