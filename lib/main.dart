import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/homeScreen.dart';
import 'package:movie_app/screens/intro.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/screens/login/signUp.dart';
import 'package:movie_app/screens/splahScreen.dart';
import 'package:movie_app/theme/appTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDHlblYLhp2PpBSaPAHa_-bL8nV2-4wwds",
              appId: "1:150040494990:android:d5a13af225673cc2b81adf",
              messagingSenderId: '150040494990',
              projectId: "movie-app-977df"),
        )
      : await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        SplachScreen.routeName: (_) => SplachScreen(),
        LoginPage.routeName: (_) => LoginPage(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SignUpPage.routeName: (_) => SignUpPage(),
      },
    );
  }
}
