import 'package:flutter/material.dart';

class GradingScreen extends StatelessWidget {
  const GradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grading'),
      ),
      body: const Center(
        child: Text('Grading Screen'),
      ),
    );
  }
}
