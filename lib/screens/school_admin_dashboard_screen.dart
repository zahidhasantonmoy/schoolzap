import 'package:flutter/material.dart';

class SchoolAdminDashboardScreen extends StatelessWidget {
  const SchoolAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Admin Dashboard'),
      ),
      body: const Center(
        child: Text('School Admin Dashboard Screen'),
      ),
    );
  }
}
