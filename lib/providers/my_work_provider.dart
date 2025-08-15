import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/student_repository.dart';
import 'package:schoolzap/models/assignment.dart';
import 'package:schoolzap/models/grade.dart';
import 'package:schoolzap/models/submission.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  return StudentRepository(ref.watch(firestoreProvider));
});

final myAssignmentsProvider = FutureProvider.family<List<Assignment>, String>((ref, studentId) {
  return ref.watch(studentRepositoryProvider).getMyAssignments(studentId);
});

final mySubmissionsProvider = FutureProvider.family<List<Submission>, String>((ref, studentId) {
  return ref.watch(studentRepositoryProvider).getMySubmissions(studentId);
});

final myGradesProvider = FutureProvider.family<List<Grade>, String>((ref, studentId) {
  return ref.watch(studentRepositoryProvider).getMyGrades(studentId);
});
