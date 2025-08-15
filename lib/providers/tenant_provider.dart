import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/tenant_repository.dart';
import 'package:schoolzap/models/school.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final tenantRepositoryProvider = Provider<TenantRepository>((ref) {
  return TenantRepository(ref.watch(firestoreProvider));
});

final tenantsProvider = FutureProvider<List<School>>((ref) {
  return ref.watch(tenantRepositoryProvider).getTenants();
});
