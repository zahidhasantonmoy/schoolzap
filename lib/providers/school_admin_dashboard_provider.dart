import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/school_admin_repository.dart';
import 'package:schoolzap/models/school_admin_dashboard_data.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final schoolAdminRepositoryProvider = Provider<SchoolAdminRepository>((ref) {
  return SchoolAdminRepository(ref.watch(firestoreProvider));
});

final schoolAdminDashboardDataProvider = FutureProvider<SchoolAdminDashboardData>((ref) {
  return ref.watch(schoolAdminRepositoryProvider).getDashboardData();
});
