class AttendanceRecord {
  final String id;
  final String studentId;
  final DateTime date;
  final String status; // e.g., 'present', 'absent', 'late'

  AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.date,
    required this.status,
  });
}
