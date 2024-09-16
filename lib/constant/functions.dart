import 'package:intl/intl.dart';

class constantsfunction {
  static String formatingdate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedYear = DateFormat.y().format(parsedDate);
    return formattedYear;
  }
}
