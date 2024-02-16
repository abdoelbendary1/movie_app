// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/theme/appTheme.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  static String routeName = "/introScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/intro.jpg"), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppTheme.backgroundColor, Colors.transparent],
                begin: AlignmentDirectional.centerStart),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text("Movie App",
                    style: Theme.of(context).textTheme.titleLarge),
                Spacer(
                  flex: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: "Unlimited movies,",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const [
                      TextSpan(text: " TV shows,"),
                      TextSpan(text: " and more"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: AppTheme.whiteColor,
                              textStyle: TextStyle(fontSize: 20),
                              minimumSize: Size(80, 60),
                              backgroundColor: AppTheme.redLightColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.routeName);
                          },
                          child: Text("Get started"),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
