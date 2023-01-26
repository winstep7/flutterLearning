import 'package:flutter/material.dart';
import 'package:flutter_scale/themes/color.dart';

class HedingText extends Text {
  HedingText(String data, {TextStyle? style})
      : super(data,
            style: TextStyle(
              fontSize: 24,
              color: primary_text,
            ));
}
