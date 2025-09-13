import 'package:flutter/material.dart';

class UserGrowthCard extends StatelessWidget {
  const UserGrowthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Growth',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            // Simple bar chart representation
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBarChartColumn('Jan', 80),
                  _buildBarChartColumn('Feb', 120),
                  _buildBarChartColumn('Mar', 160),
                  _buildBarChartColumn('Apr', 200),
                  _buildBarChartColumn('May', 250),
                  _buildBarChartColumn('Jun', 300),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChartColumn(String month, double height) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 20,
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(month, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}