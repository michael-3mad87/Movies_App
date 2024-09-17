import 'package:intl/intl.dart';

class ConstantsFunction {
  static String formattingDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedYear = DateFormat('yyyy-M-d').format(parsedDate);
    return formattedYear;
  }
}
