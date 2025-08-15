import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/teacher_repository.dart';
import 'package:schoolzap/models/assignment.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  return TeacherRepository(ref.watch(firestoreProvider));
});

final assignmentsProvider = FutureProvider.family<List<Assignment>, String>((ref, classId) {
  return ref.watch(teacherRepositoryProvider).getAssignments(classId);
});
