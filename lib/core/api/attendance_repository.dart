import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/attendance_record.dart';

class AttendanceRepository {
  final FirebaseFirestore _firestore;

  AttendanceRepository(this._firestore);

  Future<List<AttendanceRecord>> getAttendanceRecords(String studentId) async {
    final snapshot = await _firestore.collection('attendance_records')
        .where('studentId', isEqualTo: studentId)
        .get();
    return snapshot.docs.map((doc) => AttendanceRecord(
      id: doc.id,
      studentId: doc['studentId'],
      date: (doc['date'] as Timestamp).toDate(),
      status: doc['status'],
    )).toList();
  }

  Future<void> addAttendanceRecord(AttendanceRecord record) async {
    await _firestore.collection('attendance_records').add({
      'studentId': record.studentId,
      'date': record.date,
      'status': record.status,
    });
  }

  Future<void> updateAttendanceRecord(AttendanceRecord record) async {
    await _firestore.collection('attendance_records').doc(record.id).update({
      'studentId': record.studentId,
      'date': record.date,
      'status': record.status,
    });
  }
}
