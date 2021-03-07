import 'package:flutter/material.dart';

const appName = 'Read Feed';

const kPrimaryColor = Color(0x7A94FA);
const kSecondaryColor = Color(0x6176C7);
const kLightColor = Color(0xC6D1FB);
const kDarkColor = Color(0x3C487A);
const kGreyColor = Color(0x5C647A);

String activeUserId = null;

const textInputDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.only(top: 14.0),
  hintText: 'Enter your Email',
  hintStyle: kHintTextStyle,
);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: kPrimaryColor.withOpacity(1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
