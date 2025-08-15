import 'package:flutter/material.dart';
import '../models/live_metrics.dart';

class LiveMetricsCard extends StatelessWidget {
  final LiveMetrics liveMetrics;

  const LiveMetricsCard({super.key, required this.liveMetrics});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Metrics',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric(context, 'Total Schools', liveMetrics.totalSchools.toString()),
                _buildMetric(context, 'Total Students', liveMetrics.totalStudents.toString()),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric(context, 'Total Teachers', liveMetrics.totalTeachers.toString()),
                _buildMetric(context, 'Revenue', '\$${liveMetrics.revenue.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
