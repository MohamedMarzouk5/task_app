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
    apiKey: 'AIzaSyB8U_i3GIXAskLJN40fAt95bxdZWRGE-_s',
    appId: '1:1002656128100:web:4dfac751ace012d9545371',
    messagingSenderId: '1002656128100',
    projectId: 'todo-task-169b2',
    authDomain: 'todo-task-169b2.firebaseapp.com',
    storageBucket: 'todo-task-169b2.appspot.com',
    measurementId: 'G-55EDEFLDBP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCa2hQjJy2SaLDesZwUaPrKaytoriyzPdo',
    appId: '1:1002656128100:android:b9a56283308f6b06545371',
    messagingSenderId: '1002656128100',
    projectId: 'todo-task-169b2',
    storageBucket: 'todo-task-169b2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPujsauc-98T-J2ItNYdAaf9yT48HbMsw',
    appId: '1:1002656128100:ios:fc50e0aab74c6293545371',
    messagingSenderId: '1002656128100',
    projectId: 'todo-task-169b2',
    storageBucket: 'todo-task-169b2.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPujsauc-98T-J2ItNYdAaf9yT48HbMsw',
    appId: '1:1002656128100:ios:fc50e0aab74c6293545371',
    messagingSenderId: '1002656128100',
    projectId: 'todo-task-169b2',
    storageBucket: 'todo-task-169b2.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8U_i3GIXAskLJN40fAt95bxdZWRGE-_s',
    appId: '1:1002656128100:web:0eb8d3ea43617e0c545371',
    messagingSenderId: '1002656128100',
    projectId: 'todo-task-169b2',
    authDomain: 'todo-task-169b2.firebaseapp.com',
    storageBucket: 'todo-task-169b2.appspot.com',
    measurementId: 'G-BNX12P39T7',
  );
}
