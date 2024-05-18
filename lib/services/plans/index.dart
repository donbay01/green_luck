import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../../models/bank.dart';

class PlanService {
  static var db = FirebaseFirestore.instance;
  static var functions = FirebaseFunctions.instance;

  static var iapConnection = InAppPurchase.instance;

  static Future<List<ProductDetails>> getInApp(String id) async {
    var isAvailable = await iapConnection.isAvailable();
    if (!isAvailable) {
      return [];
    }

    var ids = <String>{
      id,
    };

    final response = await iapConnection.queryProductDetails(ids);

    return response.productDetails;
  }

  static Future<bool> buy(ProductDetails product) {
    final purchaseParam = PurchaseParam(
      productDetails: product,
    );
    return iapConnection.buyNonConsumable(purchaseParam: purchaseParam);
  }

  static getPlans() => db.collection('plans').orderBy('amount');

  static logSubscription(PurchaseDetails purchase) async {
    var callable = functions.httpsCallable('appleSubcription');
    final resp = await callable.call({
      'productID': purchase.productID,
      'purchaseID': purchase.purchaseID,
      'serverVerificationData':
          purchase.verificationData.serverVerificationData,
      'localVerificationData': purchase.verificationData.localVerificationData,
    });

    return resp.data;
  }

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

  static Future<CryptoInformation> getCryptoInfo() async {
    var res = await db.collection('bank').doc('crypto').get();
    var bank = CryptoInformation.fromJSON(res.data() as dynamic);
    return bank;
  }
}
