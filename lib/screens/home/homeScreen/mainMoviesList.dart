import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/Movie/movieDetails.dart';
import 'package:movie_app/screens/home/movie_list_item.dart';

class MainMovieList extends StatelessWidget {
  MainMovieList({required this.snapshot});

  AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, itemIndex, pageViewIndex) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieDetailsScreen.routeName,
                    arguments: Movie(
                      title: snapshot.data[itemIndex].title,
                      originalTitle: snapshot.data[itemIndex].originalTitle,
                      overview: snapshot.data[itemIndex].overview,
                      posterPath: snapshot.data[itemIndex].posterPath,
                      backdropPath: snapshot.data[itemIndex].backdropPath,
                      voteAverage: snapshot.data[itemIndex].voteAverage,
                      releaseDate: snapshot.data[itemIndex].releaseDate,
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  child:
                      MovieListItem(snapshot: snapshot, itemIndex: itemIndex),
                ),
              ),
          options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
              enlargeCenterPage: true,
              viewportFraction: 0.55,
              aspectRatio: 0.5,
              autoPlayAnimationDuration: Duration(seconds: 2),
              height: MediaQuery.of(context).size.height * 0.35)),
    );
  }
}
