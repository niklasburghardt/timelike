import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

DateTime getCurrentTime() {
  return new DateTime.now();
}

String getDateString() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-dd-MM');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

String getTimeString() {
  var now = new DateTime.now();
  var formatter = new DateFormat('hh:mm:ss');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

String convertDateTmeToStringTime(Timestamp timestamp) {
  DateTime dateTime = DateTime.parse(timestamp.toDate().toString());
  var formatter = DateFormat("HH:mm a");
  String formattedDate = formatter.format(dateTime);
  return formattedDate;
}
