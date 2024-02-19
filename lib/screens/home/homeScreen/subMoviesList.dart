import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/Movie/movieDetails.dart';
import 'package:movie_app/screens/home/movie_list_item.dart';

class SubMoviesList extends StatelessWidget {
  SubMoviesList({super.key, required this.snapshot, required this.movieList});

  AsyncSnapshot snapshot;
  late Future<List<Movie>> movieList;

  @override
  Widget build(BuildContext context) {
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
}
