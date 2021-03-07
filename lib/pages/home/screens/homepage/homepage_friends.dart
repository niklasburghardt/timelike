import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/images.dart';

class HomePageFriends extends StatefulWidget {
  final Function toggleView;
  HomePageFriends({this.toggleView});
  @override
  _HomePageFriendsState createState() => _HomePageFriendsState();
}

class _HomePageFriendsState extends State<HomePageFriends> {
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
              'assets/hiking_illustration.jpg',
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Friends Diary",
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20,
                        fontFamily: "Electrolize",
                        color: Colors.white.withOpacity(1)),
                  ),
                  Text(
                    "Your and your friends entries",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontFamily: "Electrolize",
                      fontSize: 12,
                      color: Colors.white.withOpacity(1),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      child: Icon(
                        Icons.arrow_back_ios,
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
      Container(
        padding: EdgeInsets.all(40),
        child: Text("Hello"),
      ),
    ]));
  }
}
