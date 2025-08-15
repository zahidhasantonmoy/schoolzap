import 'package:flutter/material.dart';

class AcademicsSetupScreen extends StatelessWidget {
  const AcademicsSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academics Setup'),
      ),
      body: const Center(
        child: Text('Academics Setup Screen'),
      ),
    );
  }
}
