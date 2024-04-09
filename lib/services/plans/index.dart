import 'package:cloud_firestore/cloud_firestore.dart';

class PlanService {
  static var db = FirebaseFirestore.instance;

  static getPlans() => db.collection('plans').orderBy('amount');
}
