import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  static var messaging = FirebaseMessaging.instance;

  static Future<String?>? getToken() async {
    var perm = await messaging.requestPermission();
    if (perm.authorizationStatus == AuthorizationStatus.authorized) {
      var token = await messaging.getToken();
      return token;
    }

    return null;
  }

  static Future<void> subscribeTopic() {
    return messaging.subscribeToTopic('free');
  }
}
