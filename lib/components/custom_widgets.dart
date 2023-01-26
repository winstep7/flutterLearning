// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/color.dart';

//input widgit
Widget inputFieldWidget(
  BuildContext context,
  Icon icon,
  String hinttext,
  String labelText,
  Function onValidate,
  Function onSave, {
  String intialValue = '',
  bool autoFocus = false,
  bool obsecureText = false,
  int maxlenght = 8,
  var keyboardType = TextInputType.text,
  var maxLines,
}) {
  return TextFormField(
    autofocus: autoFocus,
    initialValue: intialValue,
    obscureText: obsecureText,
    validator: (value) {
      return onValidate(value);
    },
    onSaved: (value) {
      return onSave(value.toString().trim());
    },
    keyboardType: keyboardType,
    //maxLength: maxlenght,
    //maxLines: maxLines,
    decoration: InputDecoration(
      label: Text(labelText),
      hintText: hinttext,
      hintStyle: TextStyle(color: secondary_text, fontSize: 14),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: IconTheme(
          data: IconThemeData(color: primary),
          child: icon,
        ),
      ),
      errorStyle: TextStyle(color: Colors.red, fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 1, color: primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 2, color: primary),
      ),
    ),
  );
}
