import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:schoolzap/providers/main_admin_dashboard_provider.dart';
import 'package:schoolzap/widgets/live_metrics_card.dart';
import 'package:schoolzap/widgets/recent_activity_card.dart';

class MainAdminDashboardScreen extends ConsumerWidget {
  const MainAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardData = ref.watch(mainAdminDashboardDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: dashboardData.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: LiveMetricsCard(liveMetrics: data.liveMetrics),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: RecentActivityCard(recentActivity: data.recentActivity),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
