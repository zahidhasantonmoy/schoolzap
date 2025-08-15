
import 'live_metrics.dart';
import 'recent_activity_item.dart';

class MainAdminDashboardData {
  final LiveMetrics liveMetrics;
  final List<RecentActivityItem> recentActivity;

  MainAdminDashboardData({
    required this.liveMetrics,
    required this.recentActivity,
  });
}
