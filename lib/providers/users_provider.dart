import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/school_admin_repository.dart';
import 'package:schoolzap/models/user.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final schoolAdminRepositoryProvider = Provider<SchoolAdminRepository>((ref) {
  return SchoolAdminRepository(ref.watch(firestoreProvider));
});

final usersProvider = FutureProvider<List<User>>((ref) {
  return ref.watch(schoolAdminRepositoryProvider).getUsers();
});
