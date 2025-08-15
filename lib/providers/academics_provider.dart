import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/academics_repository.dart';
import 'package:schoolzap/models/academic_year.dart';
import 'package:schoolzap/models/class.dart';
import 'package:schoolzap/models/section.dart';
import 'package:schoolzap/models/subject.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final academicsRepositoryProvider = Provider<AcademicsRepository>((ref) {
  return AcademicsRepository(ref.watch(firestoreProvider));
});

final academicYearsProvider = FutureProvider<List<AcademicYear>>((ref) {
  return ref.watch(academicsRepositoryProvider).getAcademicYears();
});

final classesProvider = FutureProvider.family<List<Class>, String>((ref, academicYearId) {
  return ref.watch(academicsRepositoryProvider).getClasses(academicYearId);
});

final sectionsProvider = FutureProvider.family<List<Section>, String>((ref, classId) {
  return ref.watch(academicsRepositoryProvider).getSections(classId);
});

final subjectsProvider = FutureProvider.family<List<Subject>, String>((ref, classId) {
  return ref.watch(academicsRepositoryProvider).getSubjects(classId);
});
