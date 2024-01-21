import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDmJCcwm2mLmmEAOFMvahDLs43txVtDHVA",
            authDomain: "personalizedapp-986c6.firebaseapp.com",
            projectId: "personalizedapp-986c6",
            storageBucket: "personalizedapp-986c6.appspot.com",
            messagingSenderId: "646000767864",
            appId: "1:646000767864:web:c6a06f45042d7b2209ce8d"));
  } else {
    await Firebase.initializeApp();
  }
}
