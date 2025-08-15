import 'package:flutter/material.dart';

class AddEditUserScreen extends StatelessWidget {
  const AddEditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add/Edit User'),
      ),
      body: const Center(
        child: Text('Add/Edit User Screen'),
      ),
    );
  }
}
