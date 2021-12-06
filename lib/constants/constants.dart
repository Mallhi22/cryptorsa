import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const scaffoldBodyTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'Rajdhani',
);
const scaffoldBodyTextStyleDec = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontFamily: 'Rajdhani',
);
const scaffoldBodyTextStylealgo = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontFamily: 'Rajdhani',
);

var newTextButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0)),
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF0E9FF)),
);

var textButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF0E9FF)),
  padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
);

const inputTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'Rajdhani',
  color: Colors.black54,
  fontStyle: FontStyle.italic,
);
