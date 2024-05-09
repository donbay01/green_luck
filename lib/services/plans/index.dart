import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../models/bank.dart';

class PlanService {
  static var db = FirebaseFirestore.instance;
  static var functions = FirebaseFunctions.instance;

  static getPlans() => db.collection('plans').orderBy('amount');

  static getLink(String planId) async {
    var callable = functions.httpsCallable('genLink');
    final resp = await callable.call({
      'planId': planId,
    });

    return resp.data['data']['authorization_url'];
  }
  static Future<BankInformation> getBankInfo() async {
    var res = await db.collection('bank').doc('account').get();
    var bank = BankInformation.fromJSON(res.data() as dynamic);
    return bank;
  }

}
