import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color redLightColor = Color(0xffFF2626);
  static const Color redDarkColor = Color(0xffBD1616);
  static const Color blackDarkColor = Color(0xff3D3B40);
  static ThemeData lightMode = ThemeData(
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: whiteColor),
        color: redLightColor,
        foregroundColor: whiteColor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 40, color: whiteColor, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            fontSize: 30, color: whiteColor, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            fontSize: 15, color: whiteColor, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          fontSize: 20,
          color: whiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: whiteColor,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          color: whiteColor,
        ),
      ),
      iconTheme: IconThemeData(color: whiteColor),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: whiteColor),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: redLightColor)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redDarkColor, width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redDarkColor, width: 2.0),
        ),
      ));
}
