import 'package:time_like/services/auth.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/keep_loggen_in.dart';
import 'package:time_like/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  bool _rememberMe = true;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
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
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 80.0),
                  Row(
                    children: [
                      Text("Log In", style: kLabelStyle.copyWith(fontSize: 30)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: "Enter your Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60,
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: "Enter your Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          )),
                      obscureText: true,
                      validator: (val) =>
                          val.length < 6 ? 'Password too short (min. 6)' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Forgot Password Button Pressed'),
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        'Forgot Password?',
                        style: kLabelStyle,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: Colors.blue,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          keepLoggedIn = _rememberMe;
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not sign in with those credentials';
                              loading = false;
                            });
                          }
                        }
                      },
                      elevation: 5.0,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  Text("- OR -", style: kLabelStyle.copyWith(fontSize: 18)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () => widget.toggleView(),
                      elevation: 5.0,
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'SIGN UP FOR FREE',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          letterSpacing: 1.5,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
  }
}
