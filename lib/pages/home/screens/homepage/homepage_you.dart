import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_like/services/database.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/data_time.dart';
import 'package:time_like/shared/images.dart';

class HomePageYou extends StatefulWidget {
  final Function toggleView;
  HomePageYou({this.toggleView});
  @override
  _HomePageYouState createState() => _HomePageYouState();
}

class _HomePageYouState extends State<HomePageYou> {
  List<List> allPosts = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          collapsedHeight: 20,
          toolbarHeight: 20,
          pinned: false,
          backgroundColor: kSecondaryColor.withOpacity(1),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/lake_illustration.jpg',
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Your Diary",
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20,
                        fontFamily: 'Electrolize',
                        color: Colors.white.withOpacity(1)),
                  ),
                  Text(
                    "Only your entries",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 12,
                      fontFamily: "Electrolize",
                      color: Colors.white.withOpacity(1),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        testList()
      ],
    );
  }

  SliverList testList() {
    return SliverList(
        delegate: SliverChildListDelegate([
      FlatButton(
          onPressed: () async {
            final FirebaseAuth auth = FirebaseAuth.instance;
            final FirebaseUser user = await auth.currentUser();
            DatabaseService(uid: user.uid).getOwnPostsDay(getDateString());
          },
          child: Icon(Icons.get_app)),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
    ]));
  }
}
