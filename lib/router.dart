import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolzap/screens/home_screen.dart';
import 'package:schoolzap/screens/login_screen.dart';
import 'package:schoolzap/screens/main_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/profile_screen.dart';
import 'package:schoolzap/screens/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignupScreen();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),
    GoRoute(
      path: '/main-admin-dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const MainAdminDashboardScreen();
      },
    ),
  ],
);
