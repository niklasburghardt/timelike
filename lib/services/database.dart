import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_like/shared/data_time.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userData =
      Firestore.instance.collection("UserData");

  final CollectionReference posts = Firestore.instance.collection("Posts");

  Future updateUserData(String name, String at_name) async {
    return await userData.document(uid).setData({
      'name': name,
      'username': at_name,
    });
  }

  Future createPost(String title, String story, bool private) async {
    try {
      return await userData
          .document(uid)
          .collection("days")
          .document(getDate())
          .setData({'title': title, 'story': story, 'private': private});
    } catch (error) {
      print("Unable to upload");
      return null;
    }
  }
}
