import 'package:cloud_firestore/cloud_firestore.dart';

class CodeService {
  static var db = FirebaseFirestore.instance;

  static Future<DocumentReference<Map<String, dynamic>>> sendCode(
    String collection,
    String code,
  ) {
    return db.collection(collection).add({
      'code': code,
      'timestamp': FieldValue.serverTimestamp(),
      'collection': collection,
    });
  }

  static getCodes(String collection) => db.collection(collection).orderBy(
        'timestamp',
        descending: true,
      );

  static deleteCode(String collection, String id) =>
      db.collection(collection).doc(id).delete();
}
