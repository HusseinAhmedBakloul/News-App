import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup/login/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAOWyjZ4djX32GH3SCiDls7dbkRV_vK4P4",
      appId: "1:788071188587:web:f9f94a6cae4c10d512092e",
      messagingSenderId: "788071188587",
      projectId: "fir-news-820de",
      ),
  );


  runApp(LoginSignUp());
}

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth(),
    );
  }
}
