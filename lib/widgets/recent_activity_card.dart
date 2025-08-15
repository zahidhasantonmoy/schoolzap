import 'package:flutter/material.dart';
import '../models/recent_activity_item.dart';

class RecentActivityCard extends StatelessWidget {
  final List<RecentActivityItem> recentActivity;

  const RecentActivityCard({super.key, required this.recentActivity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            ...recentActivity.map((item) => ListTile(
                  leading: const Icon(Icons.info),
                  title: Text(item.description),
                  subtitle: Text('${item.timestamp.hour}:${item.timestamp.minute}'),
                )),
          ],
        ),
      ),
    );
  }
}
