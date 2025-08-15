class Submission {
  final String id;
  final String assignmentId;
  final String studentId;
  final String fileUrl;
  final DateTime submittedAt;

  Submission({
    required this.id,
    required this.assignmentId,
    required this.studentId,
    required this.fileUrl,
    required this.submittedAt,
  });
}
