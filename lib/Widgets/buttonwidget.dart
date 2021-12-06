import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppButtonWidget extends StatelessWidget {
  AppButtonWidget(
      {Key? key, required this.buttonTitle, required this.buttonFunction})
      : super(key: key);
  String buttonTitle;
  Function() buttonFunction;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: buttonFunction,
      child: Text(
        buttonTitle,
        style: const TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Rajdhani',
        ),
      ),
      style: textButtonStyle,
    );
  }
}
