import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/school_admin_dashboard_data.dart';
import '../../models/user.dart';

class SchoolAdminRepository {
  final FirebaseFirestore _firestore;

  SchoolAdminRepository(this._firestore);

  Future<SchoolAdminDashboardData> getDashboardData() async {
    // Placeholder for fetching actual data
    await Future.delayed(const Duration(seconds: 1));
    return SchoolAdminDashboardData(
      totalStudents: 500,
      totalTeachers: 30,
      pendingFees: 5,
      upcomingEvents: 2,
    );
  }

  Future<List<User>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();
    return snapshot.docs.map((doc) => User(
      id: doc.id,
      name: doc['name'],
      email: doc['email'],
      role: doc['role'],
    )).toList();
  }

  Future<void> addUser(User user) async {
    await _firestore.collection('users').add({
      'name': user.name,
      'email': user.email,
      'role': user.role,
    });
  }

  Future<void> updateUser(User user) async {
    await _firestore.collection('users').doc(user.id).update({
      'name': user.name,
      'email': user.email,
      'role': user.role,
    });
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }
}
