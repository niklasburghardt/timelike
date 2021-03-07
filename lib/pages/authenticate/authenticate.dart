import 'package:animations/animations.dart';
import 'package:time_like/pages/authenticate/register.dart';
import 'package:time_like/pages/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
        duration: Duration(milliseconds: 600),
        reverse: showSignIn,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
        child: showSignIn
            ? SignIn(
                toggleView: toggleView,
              )
            : Register(
                toggleView: toggleView,
              ));
  }
}
