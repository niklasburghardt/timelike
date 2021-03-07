import 'package:time_like/pages/wrapper.dart';
import 'package:time_like/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_like/modules/user.dart';
import 'package:time_like/pages/entry_modules/create.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => Wrapper(),
          "/create": (context) => CreatePost(),
        },
      ),
    );
  }
}
