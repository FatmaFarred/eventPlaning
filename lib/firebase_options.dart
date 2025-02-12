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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyASpOIKGUSolSGaScuiXSpTh1J6JW_5MBA',
    appId: '1:755525484811:web:e0c9c89f94ea8d9421a20e',
    messagingSenderId: '755525484811',
    projectId: 'event-planing2',
    authDomain: 'event-planing2.firebaseapp.com',
    storageBucket: 'event-planing2.firebasestorage.app',
    measurementId: 'G-PNVYVVGCJ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn2kKUvnHkVZMUdZDX8I2J4YAepCe0wR8',
    appId: '1:755525484811:android:c1cf9216f2d0b4ac21a20e',
    messagingSenderId: '755525484811',
    projectId: 'event-planing2',
    storageBucket: 'event-planing2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAapdwa5uu1Tb7nylwUjXS0LV-OhN_ZcDU',
    appId: '1:755525484811:ios:4ccb34dd7bd9698821a20e',
    messagingSenderId: '755525484811',
    projectId: 'event-planing2',
    storageBucket: 'event-planing2.firebasestorage.app',
    iosBundleId: 'com.example.eventPlaning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAapdwa5uu1Tb7nylwUjXS0LV-OhN_ZcDU',
    appId: '1:755525484811:ios:4ccb34dd7bd9698821a20e',
    messagingSenderId: '755525484811',
    projectId: 'event-planing2',
    storageBucket: 'event-planing2.firebasestorage.app',
    iosBundleId: 'com.example.eventPlaning',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASpOIKGUSolSGaScuiXSpTh1J6JW_5MBA',
    appId: '1:755525484811:web:ebc9f7cadb38753e21a20e',
    messagingSenderId: '755525484811',
    projectId: 'event-planing2',
    authDomain: 'event-planing2.firebaseapp.com',
    storageBucket: 'event-planing2.firebasestorage.app',
    measurementId: 'G-0LYQWGFFRG',
  );
}
