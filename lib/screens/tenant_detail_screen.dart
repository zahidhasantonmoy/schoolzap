import 'package:flutter/material.dart';

class TenantDetailScreen extends StatelessWidget {
  const TenantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenant Detail'),
      ),
      body: const Center(
        child: Text('Tenant Detail Screen'),
      ),
    );
  }
}
