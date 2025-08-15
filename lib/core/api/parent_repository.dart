import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/parent_dashboard_data.dart';
import '../../models/fee.dart';

class ParentRepository {
  final FirebaseFirestore _firestore;

  ParentRepository(this._firestore);

  Future<ParentDashboardData> getDashboardData(String parentId) async {
    // Placeholder for fetching actual data
    await Future.delayed(const Duration(seconds: 1));
    return ParentDashboardData(
      childrenNames: ['John Doe', 'Jane Doe'],
      recentUpdates: [
        'John\'s Math score updated.',
        'Jane\'s attendance for today is marked present.',
      ],
    );
  }

  Future<List<Fee>> getOutstandingFees(String studentId) async {
    final snapshot = await _firestore.collection('fees')
        .where('studentId', isEqualTo: studentId)
        .where('isPaid', isEqualTo: false)
        .get();
    return snapshot.docs.map((doc) => Fee(
      id: doc.id,
      studentId: doc['studentId'],
      description: doc['description'],
      amount: doc['amount'],
      dueDate: (doc['dueDate'] as Timestamp).toDate(),
      isPaid: doc['isPaid'],
    )).toList();
  }

  Future<void> payFee(String feeId) async {
    await _firestore.collection('fees').doc(feeId).update({
      'isPaid': true,
    });
  }
}
