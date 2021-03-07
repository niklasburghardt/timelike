import 'package:time_like/modules/user.dart';
import 'package:time_like/pages/authenticate/authenticate.dart';
import 'package:time_like/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    //return either home or authenticate widget
    return user == null ? Authenticate() : Home();
  }
}
