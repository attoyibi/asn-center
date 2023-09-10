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
    apiKey: 'AIzaSyAVky5lVr9hE_t6LZaB7ojWluEVuPdq_dA',
    appId: '1:205300574586:web:b6a51794e6f9b218784ec3',
    messagingSenderId: '205300574586',
    projectId: 'asn-center1111',
    authDomain: 'asn-center1111.firebaseapp.com',
    storageBucket: 'asn-center1111.appspot.com',
    measurementId: 'G-SDMXLY9GVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBp_MUYaCYNfQQzP4pSwpTYb3OBsfNpre8',
    appId: '1:205300574586:android:d585745e1a940bc1784ec3',
    messagingSenderId: '205300574586',
    projectId: 'asn-center1111',
    storageBucket: 'asn-center1111.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVN_-lPuODFPuHEl6mjK-yfe7ZrCaYrmA',
    appId: '1:205300574586:ios:4cb411c431545cde784ec3',
    messagingSenderId: '205300574586',
    projectId: 'asn-center1111',
    storageBucket: 'asn-center1111.appspot.com',
    iosBundleId: 'com.example.asnCenter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVN_-lPuODFPuHEl6mjK-yfe7ZrCaYrmA',
    appId: '1:205300574586:ios:d1d86517299385de784ec3',
    messagingSenderId: '205300574586',
    projectId: 'asn-center1111',
    storageBucket: 'asn-center1111.appspot.com',
    iosBundleId: 'com.example.asnCenter.RunnerTests',
  );
}