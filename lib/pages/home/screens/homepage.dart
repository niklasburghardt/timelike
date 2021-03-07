import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:time_like/pages/home/screens/homepage/homepage_friends.dart';
import 'package:time_like/pages/home/screens/homepage/homepage_you.dart';
import 'package:time_like/shared/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  HomePageYou homePageYou;
  HomePageFriends homePageFriends;
  List<Widget> pages;
  int index;

  @override
  void initState() {
    homePageFriends = HomePageFriends(
      toggleView: toggleView,
    );
    homePageYou = HomePageYou(
      toggleView: toggleView,
    );
    index = 0;
    pages = [homePageYou, homePageFriends];
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      index = 0;
    } else {
      index = 1;
    }
    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 400),
      transitionBuilder: (child, animation, secondaryAnimation) =>
          SharedAxisTransition(
        transitionType: SharedAxisTransitionType.horizontal,
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: Container(
        key: ValueKey<int>(index),
        child: pages[index],
      ),
    );
  }
}
