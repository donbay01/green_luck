class BannerModel {
  final String id;
  final String url;
  final String webpage;

  BannerModel.fromJSON(String docId, Map<String, dynamic> json)
      : id = docId,
        webpage = json['webpage'],
        url = json['url'];

  BannerModel({
    required this.id,
    required this.url,
    required this.webpage,
  });
}