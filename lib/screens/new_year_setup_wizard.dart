import 'package:flutter/material.dart';

class NewYearSetupWizard extends StatelessWidget {
  const NewYearSetupWizard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Year Setup Wizard'),
      ),
      body: const Center(
        child: Text('New Year Setup Wizard Screen'),
      ),
    );
  }
}
