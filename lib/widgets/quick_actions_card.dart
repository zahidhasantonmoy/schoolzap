import 'package:flutter/material.dart';

class QuickActionsCard extends StatelessWidget {
  final VoidCallback onViewTenants;
  final VoidCallback onManageSubscriptions;
  final VoidCallback onSendAnnouncement;

  const QuickActionsCard({
    super.key,
    required this.onViewTenants,
    required this.onManageSubscriptions,
    required this.onSendAnnouncement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.business,
                  label: 'View Tenants',
                  onTap: onViewTenants,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.payment,
                  label: 'Subscriptions',
                  onTap: onManageSubscriptions,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.announcement,
                  label: 'Announce',
                  onTap: onSendAnnouncement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          iconSize: 40,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: onTap,
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}