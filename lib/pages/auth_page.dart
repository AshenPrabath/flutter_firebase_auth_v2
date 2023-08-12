import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_v2/pages/home_page.dart';
import 'package:flutter_firebase_auth_v2/pages/login_or_signup.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //show a loading indicator while checking the authentication state
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              //user is logged in, navigate to the home page
              return HomePage();
            } else {
              //user is not logged in, navigate to the login page
              return const LoginAndSignUp();
            }
          }
        },
      ),
    );
  }
}
