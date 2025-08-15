import 'package:flutter/material.dart';

class ClassroomHubScreen extends StatelessWidget {
  const ClassroomHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom Hub'),
      ),
      body: const Center(
        child: Text('Classroom Hub Screen'),
      ),
    );
  }
}
