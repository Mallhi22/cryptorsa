import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(
          fontFamily: 'Rajdhani',
        ),
      ),
      content: const Text(
        'Please Provide both the keys',
        style: inputTextStyle,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'Ok',
            style: TextStyle(
              fontFamily: 'Rajdhani',
            ),
          ),
        ),
      ],
    );
  }
}
