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
    apiKey: 'AIzaSyDwzo8VRAD_Ti_sL5jg2AQqDoVeh7_JCA0',
    appId: '1:988890345448:web:70e169ab4564ba7c9fbe5d',
    messagingSenderId: '988890345448',
    projectId: 'tea-dairy-app',
    authDomain: 'tea-dairy-app.firebaseapp.com',
    storageBucket: 'tea-dairy-app.firebasestorage.app',
    measurementId: 'G-4CCJL2JE9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEN_Rklgydq9OyoZKrS0VvkymH2JRwgsM',
    appId: '1:988890345448:android:b0690c100a69b0769fbe5d',
    messagingSenderId: '988890345448',
    projectId: 'tea-dairy-app',
    storageBucket: 'tea-dairy-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVDLQh-5fxOFtAxieYFlEX9I-9taBJiKg',
    appId: '1:988890345448:ios:48e9ab8cd37958049fbe5d',
    messagingSenderId: '988890345448',
    projectId: 'tea-dairy-app',
    storageBucket: 'tea-dairy-app.firebasestorage.app',
    iosBundleId: 'com.example.teaDiaryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVDLQh-5fxOFtAxieYFlEX9I-9taBJiKg',
    appId: '1:988890345448:ios:48e9ab8cd37958049fbe5d',
    messagingSenderId: '988890345448',
    projectId: 'tea-dairy-app',
    storageBucket: 'tea-dairy-app.firebasestorage.app',
    iosBundleId: 'com.example.teaDiaryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDwzo8VRAD_Ti_sL5jg2AQqDoVeh7_JCA0',
    appId: '1:988890345448:web:7274c4058e1f36849fbe5d',
    messagingSenderId: '988890345448',
    projectId: 'tea-dairy-app',
    authDomain: 'tea-dairy-app.firebaseapp.com',
    storageBucket: 'tea-dairy-app.firebasestorage.app',
    measurementId: 'G-JNV22DN1NJ',
  );
}
