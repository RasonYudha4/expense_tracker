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
    apiKey: 'AIzaSyBPKFq25jDjA7R0083sfgjUMmtcbbEabjgH',
    appId: '1:504015922941:web:0e286c358eeab6e0a00094',
    messagingSenderId: '504015922941',
    projectId: 'study-circle-edb04',
    authDomain: 'study-circle-edb04.firebaseapp.com',
    storageBucket: 'study-circle-edb04.firebasestorage.app',
    measurementId: 'G-BTR8KTHG9F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo3nep--IWYXFmBTTC9Vj31Wh_0htOW3M',
    appId: '1:504015922941:android:59e2080009aceb8ca00094',
    messagingSenderId: '504015922941',
    projectId: 'study-circle-edb04',
    storageBucket: 'study-circle-edb04.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmWTB-Jin51C9YItdKvuHyJMbjzxTWthM',
    appId: '1:504015922941:ios:1d7f91ab57baf1d4a00094',
    messagingSenderId: '504015922941',
    projectId: 'study-circle-edb04',
    storageBucket: 'study-circle-edb04.firebasestorage.app',
    iosBundleId: 'com.example.studyCircle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmWTB-Jin51C9YItdKvuHyJMbjzxTWthM',
    appId: '1:504015922941:ios:1d7f91ab57baf1d4a00094',
    messagingSenderId: '504015922941',
    projectId: 'study-circle-edb04',
    storageBucket: 'study-circle-edb04.firebasestorage.app',
    iosBundleId: 'com.example.studyCircle',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPKFq25jDjA7R0083sfgjUMmtcbbEabjg',
    appId: '1:504015922941:web:a57bf83344055fd4a00094',
    messagingSenderId: '504015922941',
    projectId: 'study-circle-edb04',
    authDomain: 'study-circle-edb04.firebaseapp.com',
    storageBucket: 'study-circle-edb04.firebasestorage.app',
    measurementId: 'G-RNZSHHN786',
  );
}
