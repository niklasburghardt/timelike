import 'package:flutter/services.dart';
import 'package:time_like/modules/user.dart';
import 'package:time_like/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_like/services/translate_at.dart';
import 'package:time_like/shared/constants.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      activeUserId = user.uid;
    } catch (ex) {
      print("Error");
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name, String at_name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create new data
      await DatabaseService(uid: user.uid).updateUserData(name, at_name);
      //await DatabaseService(uid: user.uid).updateUserName(at_name);
      await TranslateAt(at_name: at_name).updateUserName(user.uid);
      activeUserId = user.uid;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
