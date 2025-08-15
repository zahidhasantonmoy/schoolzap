import 'package:flutter/material.dart';

class CreateEditAssignmentScreen extends StatelessWidget {
  const CreateEditAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create/Edit Assignment'),
      ),
      body: const Center(
        child: Text('Create/Edit Assignment Screen'),
      ),
    );
  }
}
