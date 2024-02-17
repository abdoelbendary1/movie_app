import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/homeScreen.dart';
import 'package:movie_app/screens/intro.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/screens/splahScreen.dart';
import 'package:movie_app/theme/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightMode,
      initialRoute: SplachScreen.routeName,
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        SplachScreen.routeName: (_) => SplachScreen(),
        LoginPage.routeName: (_) => LoginPage(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
