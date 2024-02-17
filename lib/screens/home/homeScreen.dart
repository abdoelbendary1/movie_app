import 'package:flutter/material.dart';
import 'package:movie_app/theme/appTheme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
   static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.backgroundColor,
      ),
    );
  }
}
