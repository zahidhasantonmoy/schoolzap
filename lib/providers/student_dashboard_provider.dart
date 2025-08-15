import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/student_repository.dart';
import 'package:schoolzap/models/student_dashboard_data.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  return StudentRepository(ref.watch(firestoreProvider));
});

final studentDashboardDataProvider = FutureProvider<StudentDashboardData>((ref) {
  return ref.watch(studentRepositoryProvider).getDashboardData();
});
