import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/school.dart';

class TenantRepository {
  final FirebaseFirestore _firestore;

  TenantRepository(this._firestore);

  Future<List<School>> getTenants() async {
    final snapshot = await _firestore.collection('schools').get();
    return snapshot.docs.map((doc) => School(
      id: doc.id,
      name: doc['name'],
      adminId: doc['adminId'],
      subscriptionPlanId: doc['subscriptionPlanId'],
    )).toList();
  }
}
