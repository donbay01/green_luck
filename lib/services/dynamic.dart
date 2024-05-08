import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLink {
  static final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://www.pickyourmoment.com/"),
    uriPrefix: "https://greenluck.page.link",
    androidParameters: const AndroidParameters(
      packageName: "com.greenluck.greenluck",
    ),
    iosParameters: const IOSParameters(
      bundleId: "com.greenluck.greenluck",
    ),
  );

  static final dynamicLink = FirebaseDynamicLinks.instance;

  static Future<Uri> getLink() {
    return dynamicLink.buildLink(dynamicLinkParams);
  }
}
