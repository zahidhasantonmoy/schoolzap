import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolzap/core/api/attendance_repository.dart';
import 'package:schoolzap/models/attendance_record.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  return AttendanceRepository(ref.watch(firestoreProvider));
});

final attendanceRecordsProvider = FutureProvider.family<List<AttendanceRecord>, String>((ref, studentId) {
  return ref.watch(attendanceRepositoryProvider).getAttendanceRecords(studentId);
});
