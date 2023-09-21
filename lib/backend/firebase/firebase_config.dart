import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBuh_CkD5iO_FVnm71zzBwVa_XqnAel0xc",
            authDomain: "radius-a6683.firebaseapp.com",
            projectId: "radius-a6683",
            storageBucket: "radius-a6683.appspot.com",
            messagingSenderId: "616790690619",
            appId: "1:616790690619:web:04c6987a8444fccd99051e"));
  } else {
    await Firebase.initializeApp();
  }
}
