import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home/homeScreen/homeScreen.dart';
import 'package:movie_app/screens/home/homeScreen/mainMoviesList.dart';
import 'package:movie_app/screens/home/homeScreen/subMoviesList.dart';
import 'package:movie_app/screens/home/mainScreen.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({super.key});
  static String routeName = "/MovieDeatailsScereen";

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<List<Movie>> movieList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieList = API().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Expanded(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Container(
                      width: 250,
                      height: 250,
                      child: Image.network(
                        "${Constants.imagePath}${args.posterPath}",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("${args.title}"),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "${args.overview}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "More for you",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: FutureBuilder(
                    future: movieList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.hasData) {
                        return SubMoviesList(
                          snapshot: snapshot,
                          movieList: movieList,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
