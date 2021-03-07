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
  bool showOnlyYour = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showOnlyYour = !showOnlyYour);
  }

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
        duration: Duration(milliseconds: 400),
        reverse: showOnlyYour,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
              transitionType: SharedAxisTransitionType.horizontal,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
        child: showOnlyYour
            ? HomePageYou(
                toggleView: toggleView,
              )
            : HomePageFriends(
                toggleView: toggleView,
              ));
  }
}
