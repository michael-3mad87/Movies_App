import 'package:intl/intl.dart';

class ConstantsFunction {
  static String formattingDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      String formattedYear = DateFormat('yyyy').format(parsedDate);
      return formattedYear;
    } on Exception catch (e) {
      return DateTime.now().year.toString();
    }
  }
}
