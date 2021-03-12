import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:time_like/services/database.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/data_time.dart';

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/posts.json');
}

Future loadVault() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseUser user = await auth.currentUser();
  Map todayData = {};
  await print("Hello does this work");
  dynamic content = await DatabaseService(uid: user.uid)
      .getOwnPostsDay(getDateString())
      .then((value) => {todayData = value, print(todayData)});

//How to add/replace (add) into the json file?
}

void printData() {}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
