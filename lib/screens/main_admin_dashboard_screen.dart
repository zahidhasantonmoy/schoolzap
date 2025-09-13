import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:schoolzap/providers/main_admin_dashboard_provider.dart';
import 'package:schoolzap/widgets/live_metrics_card.dart';
import 'package:schoolzap/widgets/recent_activity_card.dart';
import 'package:schoolzap/widgets/user_growth_card.dart';
import 'package:schoolzap/widgets/quick_actions_card.dart';

class MainAdminDashboardScreen extends ConsumerWidget {
  const MainAdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardData = ref.watch(mainAdminDashboardDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'SchoolZap Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Manage Tenants'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to tenant management
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Subscriptions'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to subscription management
              },
            ),
            ListTile(
              leading: const Icon(Icons.announcement),
              title: const Text('Announcements'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to announcements
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement sign out
              },
            ),
          ],
        ),
      ),
      body: dashboardData.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: LiveMetricsCard(liveMetrics: data.liveMetrics),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: const UserGrowthCard(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: QuickActionsCard(
                    onViewTenants: () {
                      // TODO: Navigate to tenant list
                    },
                    onManageSubscriptions: () {
                      // TODO: Navigate to subscription management
                    },
                    onSendAnnouncement: () {
                      // TODO: Navigate to announcement creation
                    },
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
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
