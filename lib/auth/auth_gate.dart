import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:schoolzap/providers/auth_provider.dart';
import 'package:schoolzap/screens/home_screen.dart';
import 'package:schoolzap/screens/login_screen.dart';
import 'package:schoolzap/screens/signup_screen.dart';
import 'package:schoolzap/screens/main_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/school_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/teacher_dashboard_screen.dart';
import 'package:schoolzap/screens/student_dashboard_screen.dart';
import 'package:schoolzap/screens/parent_dashboard_screen.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  bool showLoginScreen = true;

  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          final currentUser = ref.watch(currentUserProvider);
          return currentUser.when(
            data: (appUser) {
              if (appUser != null) {
                switch (appUser.role) {
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
            loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
            error: (error, stackTrace) => const Scaffold(body: Center(child: Text('Error fetching user data'))),
          );
        } else {
          if (showLoginScreen) {
            return LoginScreen(showSignUpScreen: toggleScreens);
          } else {
            return SignUpScreen(showLoginScreen: toggleScreens);
          }
        }
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) => const Scaffold(body: Center(child: Text('Error with authentication'))),
    );
  }
}