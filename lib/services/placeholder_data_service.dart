import '../models/live_metrics.dart';
import '../models/recent_activity_item.dart';
import '../models/main_admin_dashboard_data.dart';

class PlaceholderDataService {
  Future<MainAdminDashboardData> getMainAdminDashboardData() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    return MainAdminDashboardData(
      liveMetrics: LiveMetrics(
        totalSchools: 12,
        totalStudents: 1500,
        totalTeachers: 100,
        revenue: 50000.00,
      ),
      recentActivity: [
        RecentActivityItem(
          description: 'New school "Greenwood High" joined.',
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        RecentActivityItem(
          description: 'Subscription plan for "Oakridge International" updated.',
          timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        RecentActivityItem(
          description: 'New admin user created for "North Star Academy".',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ],
    );
  }
}
