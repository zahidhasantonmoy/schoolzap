import 'package:flutter/material.dart';

class SchoolCustomizationScreen extends StatelessWidget {
  const SchoolCustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Customization'),
      ),
      body: const Center(
        child: Text('School Customization Screen'),
      ),
    );
  }
}
