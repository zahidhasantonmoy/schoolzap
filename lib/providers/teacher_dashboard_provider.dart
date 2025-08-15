import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/teacher_repository.dart';
import 'package:schoolzap/models/teacher_dashboard_data.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  return TeacherRepository(ref.watch(firestoreProvider));
});

final teacherDashboardDataProvider = FutureProvider<TeacherDashboardData>((ref) {
  return ref.watch(teacherRepositoryProvider).getDashboardData();
});
