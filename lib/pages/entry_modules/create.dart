import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:time_like/modules/user.dart';
import 'package:time_like/services/auth.dart';
import 'package:time_like/services/database.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/data_time.dart';
import 'package:time_like/shared/loading.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String name = '';
  IconData privacy = Icons.lock_open;
  bool loading = false;

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
    return loading
        ? LoadingScreen()
        : Hero(
            tag: "dash",
            child: Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  print("Hello");
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        kPrimaryColor.withOpacity(1),
                        kSecondaryColor.withOpacity(1)
                      ],
                          stops: [
                        0,
                        0.9
                      ])),
                  child: SingleChildScrollView(
                      child: Stack(children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.arrow_back,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                FlatButton(
                                    child: Icon(Icons.camera_alt_outlined,
                                        color: Colors.white),
                                    onPressed: () {
                                      print("Take Photo");
                                    }),
                                IconButton(
                                    icon: Icon(privacy, color: Colors.white),
                                    onPressed: () {
                                      changePrivacy();
                                    })
                              ],
                            ),
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
                                      offset: Offset(0, 0.6),
                                      blurRadius: 5,
                                      color: kDarkColor.withOpacity(0.5))
                                ]),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText:
                                      "e.g.:Skydiving for the firest time",
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
                                      offset: Offset(0, 0.6),
                                      blurRadius: 5,
                                      color: kDarkColor.withOpacity(0.5))
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              onPressed: () async {
                                if (title.length > 0 && story.length > 0) {
                                  setState(() {
                                    loading = true;
                                  });
                                } else {
                                  return;
                                }
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final FirebaseUser user =
                                    await auth.currentUser();
                                dynamic post =
                                    await DatabaseService(uid: user.uid)
                                        .createPost(title, story, private);
                                setState(() {
                                  loading = false;
                                });
                              },
                              elevation: 5.0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              child: Text(
                                'UPLOAD',
                                style: TextStyle(
                                  color: Color(0xFF527DAA),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Electrolize',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ])),
                ),
              ),
            ),
          );
  }
}
