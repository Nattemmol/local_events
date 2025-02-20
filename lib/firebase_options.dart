// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
///import 'firebase_options.dart';
/// // ...
///await Firebase.initializeApp(
///  options: DefaultFirebaseOptions.currentPlatform,
///);
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
    apiKey: 'AIzaSyCE70TBmPvJO30Rkp3RQC8nZCKzpywUnzU',
    appId: '1:802595696845:web:8455d76f58e81fb18af984',
    messagingSenderId: '802595696845',
    projectId: 'localevents-53e86',
    authDomain: 'localevents-53e86.firebaseapp.com',
    storageBucket: 'localevents-53e86.firebasestorage.app',
    measurementId: 'G-MFDZDFS3HC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6uhROT-qesoJrdFmbnNs6PABo6K88Hdk',
    appId: '1:802595696845:android:0981d81d00b7c3528af984',
    messagingSenderId: '802595696845',
    projectId: 'localevents-53e86',
    storageBucket: 'localevents-53e86.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK1zfhknD5IzLEUJA28HEk75kzIbrXxsA',
    appId: '1:802595696845:ios:987fff09b88452508af984',
    messagingSenderId: '802595696845',
    projectId: 'localevents-53e86',
    storageBucket: 'localevents-53e86.firebasestorage.app',
    iosClientId: '802595696845-j752o0llc857ebkf2qlv535gu2d2o5ur.apps.googleusercontent.com',
    iosBundleId: 'com.example.localEvents',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAK1zfhknD5IzLEUJA28HEk75kzIbrXxsA',
    appId: '1:802595696845:ios:987fff09b88452508af984',
    messagingSenderId: '802595696845',
    projectId: 'localevents-53e86',
    storageBucket: 'localevents-53e86.firebasestorage.app',
    iosClientId: '802595696845-j752o0llc857ebkf2qlv535gu2d2o5ur.apps.googleusercontent.com',
    iosBundleId: 'com.example.localEvents',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCE70TBmPvJO30Rkp3RQC8nZCKzpywUnzU',
    appId: '1:802595696845:web:2cef9387e8c183808af984',
    messagingSenderId: '802595696845',
    projectId: 'localevents-53e86',
    authDomain: 'localevents-53e86.firebaseapp.com',
    storageBucket: 'localevents-53e86.firebasestorage.app',
    measurementId: 'G-1T5H3B5Z85',
  );

}