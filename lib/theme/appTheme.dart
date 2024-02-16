import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color redLightColor = Color(0xffFF2626);
  static const Color redDarkColor = Color(0xffBD1616);
  static ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 40, color: whiteColor, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: whiteColor,
      ),
    ),
  );
}
