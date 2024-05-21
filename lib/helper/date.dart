import 'package:intl/intl.dart';

class DateHelper {
  static String formateDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return formattedTime;
  }

  static String formateDay(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedTime;
  }
}
