import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/screens/intro.dart';
import 'package:movie_app/theme/appTheme.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});
  static String routeName = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
          child: LottieBuilder.asset("assets/Animation - 1708122176784.json")),
      nextScreen: IntroScreen(),
      backgroundColor: AppTheme.backgroundColor,
      splashIconSize: 200,
    );
  }
}
