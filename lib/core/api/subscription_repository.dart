import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/subscription_plan.dart';

class SubscriptionRepository {
  final FirebaseFirestore _firestore;

  SubscriptionRepository(this._firestore);

  Future<List<SubscriptionPlan>> getSubscriptionPlans() async {
    final snapshot = await _firestore.collection('subscription_plans').get();
    return snapshot.docs.map((doc) => SubscriptionPlan(
      id: doc.id,
      name: doc['name'],
      features: List<String>.from(doc['features']),
    )).toList();
  }
}
