import 'package:cloud_firestore/cloud_firestore.dart';

class TranslateAt {
  final String at_name;

  TranslateAt({this.at_name});
  //collection reference
  final CollectionReference users = Firestore.instance.collection("Users");

  Future checkUserExists() async {
    final snapShot = await users.document(at_name).get();

    if (snapShot.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future updateUserName(String uid) async {
    return await users.document(at_name).setData({
      'userID': uid,
    });
  }

  Future getUserID() async {
    final snapShot = await users.document(at_name).get();

    if (snapShot.exists) {
      return snapShot;
    } else {
      return null;
    }
  }
}
