import 'package:time_like/services/translate_at.dart';
import 'package:time_like/shared/constants.dart';
import 'package:time_like/shared/keep_loggen_in.dart';
import 'package:time_like/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:time_like/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String confirmedPassword = '';
  String name = '';
  String at_name = '';
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            body: Container(
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
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Row(
                      children: [
                        Text("Register",
                            style: kLabelStyle.copyWith(fontSize: 30)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [Text("User Name", style: kLabelStyle)],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60,
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Name",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        validator: (val) =>
                            val.length < 1 ? 'Enter a name' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60,
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "@Username",
                            prefixIcon: Icon(
                              Icons.person_add,
                              color: Colors.white,
                            )),
                        validator: (val) =>
                            val.length < 1 && val.startsWith("@")
                                ? 'Enter a name'
                                : null,
                        onChanged: (val) {
                          setState(() => at_name = val);
                        },
                      ),
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
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            )),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
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
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.white)),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Password too short (min. 6)'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 60,
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.white)),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Password too short (min. 6)'
                            : null,
                        onChanged: (val) {
                          setState(() => confirmedPassword = val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20.0,
                            child: Row(
                              children: <Widget>[
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
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
                          Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () => widget.toggleView(),
                              padding: EdgeInsets.only(right: 0.0),
                              child: Text(
                                'Sign In',
                                style: kLabelStyle,
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(height: 20.0),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate() &&
                              password == confirmedPassword) {
                            setState(() {
                              loading = true;
                            });
                            dynamic user_exists =
                                await TranslateAt(at_name: at_name)
                                    .checkUserExists();
                            if (user_exists == true) {
                              setState(() {
                                error = 'Username is already user';
                                loading = false;
                              });
                              return;
                            }
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, name, at_name);
                            keepLoggedIn = _rememberMe;
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
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
                          'REGISTER',
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
                  ],
                ),
              ),
            ),
          );
  }
}
