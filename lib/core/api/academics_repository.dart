import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/academic_year.dart';
import '../../models/class.dart';
import '../../models/section.dart';
import '../../models/subject.dart';

class AcademicsRepository {
  final FirebaseFirestore _firestore;

  AcademicsRepository(this._firestore);

  Future<List<AcademicYear>> getAcademicYears() async {
    final snapshot = await _firestore.collection('academic_years').get();
    return snapshot.docs.map((doc) => AcademicYear(
      id: doc.id,
      name: doc['name'],
      startDate: (doc['startDate'] as Timestamp).toDate(),
      endDate: (doc['endDate'] as Timestamp).toDate(),
    )).toList();
  }

  Future<List<Class>> getClasses(String academicYearId) async {
    final snapshot = await _firestore.collection('classes')
        .where('academicYearId', isEqualTo: academicYearId)
        .get();
    return snapshot.docs.map((doc) => Class(
      id: doc.id,
      name: doc['name'],
      academicYearId: doc['academicYearId'],
    )).toList();
  }

  Future<List<Section>> getSections(String classId) async {
    final snapshot = await _firestore.collection('sections')
        .where('classId', isEqualTo: classId)
        .get();
    return snapshot.docs.map((doc) => Section(
      id: doc.id,
      name: doc['name'],
      classId: doc['classId'],
    )).toList();
  }

  Future<List<Subject>> getSubjects(String classId) async {
    final snapshot = await _firestore.collection('subjects')
        .where('classId', isEqualTo: classId)
        .get();
    return snapshot.docs.map((doc) => Subject(
      id: doc.id,
      name: doc['name'],
      classId: doc['classId'],
    )).toList();
  }
}
