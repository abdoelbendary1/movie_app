import 'package:flutter/material.dart';
import 'package:movie_app/theme/appTheme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
   static String routeName = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
    );
  }
}
