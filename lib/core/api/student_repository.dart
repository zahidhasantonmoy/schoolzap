import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/student_dashboard_data.dart';
import '../../models/assignment.dart';
import '../../models/submission.dart';
import '../../models/grade.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;

  StudentRepository(this._firestore);

  Future<StudentDashboardData> getDashboardData() async {
    // Placeholder for fetching actual data
    await Future.delayed(const Duration(seconds: 1));
    return StudentDashboardData(
      upcomingAssignments: [
        'Math Homework due tomorrow',
        'Science Project due next week',
      ],
      upcomingEvents: [
        'School Play on Friday',
        'Parent-Teacher Conference next Monday',
      ],
    );
  }

  Future<List<Assignment>> getMyAssignments(String studentId) async {
    final snapshot = await _firestore.collection('assignments')
        .where('assignedTo', arrayContains: studentId) // Assuming assignments are assigned to students
        .get();
    return snapshot.docs.map((doc) => Assignment(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      dueDate: (doc['dueDate'] as Timestamp).toDate(),
      classId: doc['classId'],
      subjectId: doc['subjectId'],
    )).toList();
  }

  Future<List<Submission>> getMySubmissions(String studentId) async {
    final snapshot = await _firestore.collection('submissions')
        .where('studentId', isEqualTo: studentId)
        .get();
    return snapshot.docs.map((doc) => Submission(
      id: doc.id,
      assignmentId: doc['assignmentId'],
      studentId: doc['studentId'],
      fileUrl: doc['fileUrl'],
      submittedAt: (doc['submittedAt'] as Timestamp).toDate(),
    )).toList();
  }

  Future<List<Grade>> getMyGrades(String studentId) async {
    final snapshot = await _firestore.collection('grades')
        .where('studentId', isEqualTo: studentId) // Assuming grades are linked to students
        .get();
    return snapshot.docs.map((doc) => Grade(
      id: doc.id,
      submissionId: doc['submissionId'],
      score: doc['score'],
      feedback: doc['feedback'],
    )).toList();
  }

  Future<void> submitAssignment(Submission submission) async {
    await _firestore.collection('submissions').add({
      'assignmentId': submission.assignmentId,
      'studentId': submission.studentId,
      'fileUrl': submission.fileUrl,
      'submittedAt': submission.submittedAt,
    });
  }
}
