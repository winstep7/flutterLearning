import 'package:flutter/material.dart';
import 'color.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'NotoSansLao',
    primaryColor: primary,
    errorColor: accent,
    hoverColor: divider,
    colorScheme: ColorScheme.light(primary: primary),
    iconTheme: IconThemeData(color: primary_text),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: icon,
      iconTheme: IconThemeData(color: icon),
    ),
  );
}
