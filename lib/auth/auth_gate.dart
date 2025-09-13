import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolzap/screens/home_screen.dart';
import 'package:schoolzap/screens/login_screen.dart';
import 'package:schoolzap/screens/signup_screen.dart';
import 'package:schoolzap/screens/main_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/school_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/teacher_dashboard_screen.dart';
import 'package:schoolzap/screens/student_dashboard_screen.dart';
import 'package:schoolzap/screens/parent_dashboard_screen.dart';

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
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(snapshot.data!.uid).get(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(body: Center(child: CircularProgressIndicator()));
              }
              if (userSnapshot.hasError) {
                return const Scaffold(body: Center(child: Text('Error fetching user role')));
              }
              if (userSnapshot.hasData && userSnapshot.data!.exists) {
                final userRole = userSnapshot.data!['role'];
                switch (userRole) {
                  case 'main_admin':
                    return const MainAdminDashboardScreen();
                  case 'school_admin':
                    return const SchoolAdminDashboardScreen();
                  case 'teacher':
                    return const TeacherDashboardScreen();
                  case 'student':
                    return const StudentDashboardScreen();
                  case 'parent':
                    return const ParentDashboardScreen();
                  default:
                    return const HomeScreen(); // Default for unknown roles
                }
              }
              return const HomeScreen(); // Fallback if user data doesn't exist
            },
          );
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