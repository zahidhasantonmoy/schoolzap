import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/main_admin_dashboard_data.dart';
import '../services/placeholder_data_service.dart';

final placeholderDataServiceProvider = Provider((ref) => PlaceholderDataService());

final mainAdminDashboardDataProvider = FutureProvider<MainAdminDashboardData>((ref) {
  final dataService = ref.watch(placeholderDataServiceProvider);
  return dataService.getMainAdminDashboardData();
});
