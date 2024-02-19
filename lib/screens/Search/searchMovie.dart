import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/Movie/movieDetails.dart';
import 'package:movie_app/screens/home/movie_list_item.dart';

class SearchMovie extends SearchDelegate {
  late Future<List<Movie>> movieList;
  API movies = API();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: movieList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, itemIndex) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieDetailsScreen.routeName,
                    arguments: Movie(
                      title: snapshot.data?[itemIndex].title,
                      originalTitle: snapshot.data?[itemIndex].originalTitle,
                      overview: snapshot.data?[itemIndex].overview,
                      posterPath: snapshot.data?[itemIndex].posterPath,
                      backdropPath: snapshot.data?[itemIndex].backdropPath,
                      voteAverage: snapshot.data?[itemIndex].voteAverage,
                      releaseDate: snapshot.data?[itemIndex].releaseDate,
                    ),
                  );
                },
                child: MovieListItem(
                  itemIndex: itemIndex,
                  snapshot: snapshot,
                ),
              ),
              itemCount: snapshot.data?.length,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search movie"),
    );
  }
}
