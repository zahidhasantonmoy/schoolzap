import 'package:flutter/material.dart';

class SubmissionScreen extends StatelessWidget {
  const SubmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submission'),
      ),
      body: const Center(
        child: Text('Submission Screen'),
      ),
    );
  }
}
