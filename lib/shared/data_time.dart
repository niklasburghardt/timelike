import 'package:intl/intl.dart';

String getDate() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-dd-MM');
  String formattedDate = formatter.format(now);
  return formattedDate;
}
