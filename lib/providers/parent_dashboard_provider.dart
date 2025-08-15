import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/parent_repository.dart';
import 'package:schoolzap/models/parent_dashboard_data.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final parentRepositoryProvider = Provider<ParentRepository>((ref) {
  return ParentRepository(ref.watch(firestoreProvider));
});

final parentDashboardDataProvider = FutureProvider.family<ParentDashboardData, String>((ref, parentId) {
  return ref.watch(parentRepositoryProvider).getDashboardData(parentId);
});
