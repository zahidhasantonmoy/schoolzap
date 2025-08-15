import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolzap/auth/auth_gate.dart';
import 'package:schoolzap/screens/home_screen.dart';
import 'package:schoolzap/screens/main_admin_dashboard_screen.dart';
import 'package:schoolzap/screens/profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/authGate',
  routes: <GoRoute>[
    GoRoute(
      path: '/authGate',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthGate();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
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
