// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/screens/Search/SearchScreen.dart';
import 'package:movie_app/screens/Search/searchMovie.dart';
import 'package:movie_app/screens/home/homeScreen/homeScreen.dart';
import 'package:movie_app/theme/appTheme.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  static String routeName = "/mainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(backgroundColor: AppTheme.primaryColor, actions: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchMovie(),
              );
            },
            icon: Icon(Icons.search))
      ]),
      bottomNavigationBar: GNav(
          onTabChange: (index) {
            selectedIndex = index;
            setState(() {});
            print(selectedIndex);
          },
          tabBorderRadius: 5,
          curve: Easing.legacyAccelerate,
          gap: 20,
          backgroundColor: AppTheme.backgroundColor,
          activeColor: AppTheme.whiteColor,
          tabBackgroundColor: AppTheme.primaryColor.withOpacity(0.8),
          duration: Duration(milliseconds: 500),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.favorite,
              text: "Favorite",
            ),
            GButton(
              icon: Icons.person,
              text: "User",
            ),
          ]),
      body: tabs[selectedIndex],
    );
  }
}
