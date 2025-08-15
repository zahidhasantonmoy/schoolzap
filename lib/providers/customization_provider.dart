import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/customization_repository.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final customizationRepositoryProvider = Provider<CustomizationRepository>((ref) {
  return CustomizationRepository(ref.watch(firestoreProvider));
});
