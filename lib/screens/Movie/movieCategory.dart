import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/homeScreen/subMoviesList.dart';

class MovieSearchScreen extends StatefulWidget {
  MovieSearchScreen({super.key});
  static String routeName = "/MovieSearchScreen";

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  late Future<List<Movie>> allMoviesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMoviesList = API().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: FutureBuilder(
        future: allMoviesList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return SubMoviesList(
              snapshot: snapshot,
              movieList: allMoviesList,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
