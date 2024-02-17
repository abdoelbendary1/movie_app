import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/theme/appTheme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: AppTheme.backgroundColor,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: AppTheme.redLightColor,
                foregroundColor: AppTheme.whiteColor),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            child: Text(
              "Sing Out",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
