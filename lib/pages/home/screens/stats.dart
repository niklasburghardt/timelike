import 'package:time_like/services/auth.dart';
import 'package:flutter/material.dart';

class DiaryStats extends StatefulWidget {
  @override
  _DiaryStatsState createState() => _DiaryStatsState();
}

class _DiaryStatsState extends State<DiaryStats> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478DE0),
            Color(0xFF398AE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Sign out")),
        ),
      ),
    );
  }
}
