import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_like/shared/data_time.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection reference
  CollectionReference userData = Firestore.instance.collection("UserData");

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
          .collection("Days")
          .document(getDateString())
          .collection("Posts")
          .document()
          .setData({
        'title': title,
        'story': story,
        'private': private,
        'time': getCurrentTime()
      });
    } catch (error) {
      print("Unable to upload");
      return null;
    }
  }

  Future getOwnPostsDay(String day) async {
    Map postDay = {day: {}};
    userData
        .document(uid)
        .collection("Days")
        .document(day)
        .collection("Posts")
        .orderBy("time", descending: false)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        postDay[day][convertDateTmeToStringTime(doc.data["time"])] = doc.data;
      });
      return postDay;
    });
  }
}
