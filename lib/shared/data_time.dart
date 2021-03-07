import 'package:intl/intl.dart';

String getDate() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-dd-MM');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

String getTime() {
  var now = new DateTime.now();
  var formatter = new DateFormat('hh:mm:ss');
  String formattedDate = formatter.format(now);
  return formattedDate;
}
