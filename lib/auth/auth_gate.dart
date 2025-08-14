import 'package:flutter/material.dart';
import 'package:schoolzap/screens/home_screen.dart';
import 'package:schoolzap/screens/login_screen.dart';
import 'package:schoolzap/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool showLoginScreen = true;

  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          if (showLoginScreen) {
            return LoginScreen(showSignUpScreen: toggleScreens);
          } else {
            return SignUpScreen(showLoginScreen: toggleScreens);
          }
        }
      },
    );
  }
}