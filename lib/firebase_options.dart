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
    apiKey: 'AIzaSyAFfLRKcT7xdTwjGfaOBfozZjJH6u7lrzs',
    appId: '1:47256033009:web:be3562743c7c50384c3b50',
    messagingSenderId: '47256033009',
    projectId: 'movies-4df11',
    authDomain: 'movies-4df11.firebaseapp.com',
    databaseURL: 'https://movies-4df11-default-rtdb.firebaseio.com',
    storageBucket: 'movies-4df11.appspot.com',
    measurementId: 'G-19YTMWT6PQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBS7I7QgCWYMQmjNhNoUWhF9C3uI31yerg',
    appId: '1:47256033009:android:a523a3710cb95a734c3b50',
    messagingSenderId: '47256033009',
    projectId: 'movies-4df11',
    databaseURL: 'https://movies-4df11-default-rtdb.firebaseio.com',
    storageBucket: 'movies-4df11.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyphli9XaEfD-AmNi1eX9WX8GkoyNf8Ng',
    appId: '1:47256033009:ios:6913e617a1efa44f4c3b50',
    messagingSenderId: '47256033009',
    projectId: 'movies-4df11',
    databaseURL: 'https://movies-4df11-default-rtdb.firebaseio.com',
    storageBucket: 'movies-4df11.appspot.com',
    iosClientId: '47256033009-f3ieqfr6h7kc6l5mu3rrcoda0e38n377.apps.googleusercontent.com',
    iosBundleId: 'com.example.movies',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyphli9XaEfD-AmNi1eX9WX8GkoyNf8Ng',
    appId: '1:47256033009:ios:92fc6862e7a1ae234c3b50',
    messagingSenderId: '47256033009',
    projectId: 'movies-4df11',
    databaseURL: 'https://movies-4df11-default-rtdb.firebaseio.com',
    storageBucket: 'movies-4df11.appspot.com',
    iosClientId: '47256033009-3v24e9qocfkpea5np75bteei1prbn555.apps.googleusercontent.com',
    iosBundleId: 'com.example.movies.RunnerTests',
  );
}
