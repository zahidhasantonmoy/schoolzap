import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/parent_repository.dart';
import 'package:schoolzap/models/fee.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final parentRepositoryProvider = Provider<ParentRepository>((ref) {
  return ParentRepository(ref.watch(firestoreProvider));
});

final outstandingFeesProvider = FutureProvider.family<List<Fee>, String>((ref, studentId) {
  return ref.watch(parentRepositoryProvider).getOutstandingFees(studentId);
});
