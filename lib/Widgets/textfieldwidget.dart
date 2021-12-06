import 'package:cryptorsa/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({required this.hintTexts, required this.textFieldFunction});
  String hintTexts;
  Function(String) textFieldFunction;
  TextEditingController updateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: FocusNode(),
      controller: updateText,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      maxLines: 3,
      onChanged: textFieldFunction,
      style: inputTextStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffffffff),
        border: const OutlineInputBorder(),
        hintText: hintTexts,
      ),
    );
  }
}
