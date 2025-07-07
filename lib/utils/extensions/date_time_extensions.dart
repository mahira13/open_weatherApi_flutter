import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// convert the DateTime to day => 2023-09-24 = Sunday
  String convertToDay() {
    return DateFormat.EEEE().format(this);
  }
   String convertToDayAbbr() {
    return DateFormat.E().format(this);
  }
}
