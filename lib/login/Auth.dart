import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/login/WelcomeScreen.dart';
import 'package:signup/views/loadingPage.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
              return LoadingPage();           
          } else {
            return WelcomeScreen();
          }
        }),
        
      ),
    );
  }
}