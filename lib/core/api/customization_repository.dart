import 'package:cloud_firestore/cloud_firestore.dart';

class CustomizationRepository {
  final FirebaseFirestore _firestore;

  CustomizationRepository(this._firestore);

  Future<void> uploadSchoolLogo(String schoolId, String imageUrl) async {
    await _firestore.collection('schools').doc(schoolId).update({
      'logoUrl': imageUrl,
    });
  }

  Future<void> updateSchoolThemeColor(String schoolId, String colorHex) async {
    await _firestore.collection('schools').doc(schoolId).update({
      'themeColor': colorHex,
    });
  }
}
