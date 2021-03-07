import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:time_like/modules/user.dart';
import 'package:time_like/services/auth.dart';
import 'package:time_like/services/database.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/data_time.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String name = '';
  IconData privacy = Icons.lock_open;

  String title = '';
  String story = '';
  bool private = false;

  void changePrivacy() {
    setState(() {
      private = !private;
      privacy = private ? Icons.lock : Icons.lock_open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "dash",
      child: Scaffold(
        backgroundColor: kPrimaryColor.withOpacity(1),
        appBar: AppBar(
          title: Text("Create Entry"),
          centerTitle: true,
          backgroundColor: kSecondaryColor.withOpacity(1),
          elevation: 2,
          toolbarHeight: 80,
          actions: [
            IconButton(
                icon: Icon(privacy),
                onPressed: () async {
                  print(getDate());
                  changePrivacy();
                })
          ],
        ),
        body: Form(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Electrolize",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 10,
                          color: kDarkColor.withOpacity(1))
                    ]),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "e.g.:Skydiving for the firest time",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (val) {
                    setState(() => title = val);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      "Story",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Electrolize",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 10,
                          color: kDarkColor.withOpacity(1))
                    ]),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                      hintText:
                          "e.g.: Today I jumped off a plane, which was kinda scary",
                      hintStyle: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  onChanged: (val) {
                    setState(() => story = val);
                  },
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final FirebaseUser user = await auth.currentUser();
                    dynamic post = await DatabaseService(uid: user.uid)
                        .createPost(title, story, private);
                    if (post == null) {
                      print("Error");
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
