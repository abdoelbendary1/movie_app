import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xff000000);
  static const Color bottomAppBarColor = Color(0xff2B2B28);
  static const Color yellowColor = Color(0xffE3B04B);
  static const Color primaryColor = Color(0xffF73859);

  static const Color whiteColor = Color(0xffEDEDED);
  static const Color redLightColor = Color(0xffFF2626);
  static const Color redDarkColor = Color(0xffBD1616);
  static const Color blackDarkColor = Color(0xff3D3B40);
  static ThemeData lightMode = ThemeData(
      primaryColor: bottomAppBarColor,
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
      bottomAppBarTheme: BottomAppBarTheme(
        color: bottomAppBarColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 20),
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: bottomAppBarColor,
        elevation: 0,
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
