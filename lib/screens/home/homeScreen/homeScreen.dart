// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/homeScreen/mainMoviesList.dart';
import 'package:movie_app/screens/home/homeScreen/subMoviesList.dart';
import 'package:movie_app/screens/home/movie_list_item.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/theme/appTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingList;
  late Future<List<Movie>> topRatedList;
  late Future<List<Movie>> upcomingList;
  late Future<List<Movie>> popularList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingList = API().getTrendingMovies();
    topRatedList = API().getTopRatedMovies();
    upcomingList = API().getupcomingMovies();
    popularList = API().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Trending",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              child: FutureBuilder(
                future: trendingList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    return MainMovieList(
                      snapshot: snapshot,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Top Rated",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FutureBuilder(
                future: topRatedList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return SubMoviesList(
                      snapshot: snapshot,
                      movieList: trendingList,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Popular",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FutureBuilder(
                future: popularList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return SubMoviesList(
                      snapshot: snapshot,
                      movieList: popularList,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Upcoming",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FutureBuilder(
                future: upcomingList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    return SubMoviesList(
                      snapshot: snapshot,
                      movieList: upcomingList,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
