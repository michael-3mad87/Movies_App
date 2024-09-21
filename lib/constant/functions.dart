import 'package:intl/intl.dart';

<<<<<<< HEAD
class constantsfunction {
  static String formatingdate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedYear = DateFormat.y().format(parsedDate);
    return formattedYear;
=======
class ConstantsFunction {
  static String formattingDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      String formattedYear = DateFormat('yyyy').format(parsedDate);
      return formattedYear;
    } on Exception catch (e) {
      return DateTime.now().year.toString();
    }
>>>>>>> origin/feature/home
  }
}
