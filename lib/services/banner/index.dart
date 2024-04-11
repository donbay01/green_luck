import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/banner.dart';

class BannerService {
  static var db = FirebaseFirestore.instance;

  static Future<List<BannerModel>> getBanners() async {
    var res = await db.collection('banners').get();
    var data =
        res.docs.map((e) => BannerModel.fromJSON(e.id, e.data())).toList();
    return data;
  }
}
