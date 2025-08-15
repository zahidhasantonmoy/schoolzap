import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/teacher_dashboard_data.dart';
import '../../models/assignment.dart';
import '../../models/submission.dart';
import '../../models/grade.dart';

class TeacherRepository {
  final FirebaseFirestore _firestore;

  TeacherRepository(this._firestore);

  Future<TeacherDashboardData> getDashboardData() async {
    // Placeholder for fetching actual data
    await Future.delayed(const Duration(seconds: 1));
    return TeacherDashboardData(
      todaysAgenda: [
        'Grade Math Assignment',
        'Prepare for Science Class',
        'Meeting with Parents',
      ],
    );
  }

  Future<List<Assignment>> getAssignments(String classId) async {
    final snapshot = await _firestore.collection('assignments')
        .where('classId', isEqualTo: classId)
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

  Future<void> createAssignment(Assignment assignment) async {
    await _firestore.collection('assignments').add({
      'title': assignment.title,
      'description': assignment.description,
      'dueDate': assignment.dueDate,
      'classId': assignment.classId,
      'subjectId': assignment.subjectId,
    });
  }

  Future<void> updateAssignment(Assignment assignment) async {
    await _firestore.collection('assignments').doc(assignment.id).update({
      'title': assignment.title,
      'description': assignment.description,
      'dueDate': assignment.dueDate,
      'classId': assignment.classId,
      'subjectId': assignment.subjectId,
    });
  }

  Future<void> deleteAssignment(String assignmentId) async {
    await _firestore.collection('assignments').doc(assignmentId).delete();
  }

  Future<List<Submission>> getSubmissions(String assignmentId) async {
    final snapshot = await _firestore.collection('submissions')
        .where('assignmentId', isEqualTo: assignmentId)
        .get();
    return snapshot.docs.map((doc) => Submission(
      id: doc.id,
      assignmentId: doc['assignmentId'],
      studentId: doc['studentId'],
      fileUrl: doc['fileUrl'],
      submittedAt: (doc['submittedAt'] as Timestamp).toDate(),
    )).toList();
  }

  Future<void> gradeSubmission(Grade grade) async {
    await _firestore.collection('grades').add({
      'submissionId': grade.submissionId,
      'score': grade.score,
      'feedback': grade.feedback,
    });
  }
}
