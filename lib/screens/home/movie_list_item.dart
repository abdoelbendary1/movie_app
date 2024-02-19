import 'package:flutter/material.dart';
import 'package:movie_app/models/constants.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({
    super.key,
    required this.snapshot,
    required this.itemIndex,
  });

  AsyncSnapshot snapshot;
  int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Image.network(
              "${Constants.imagePath}${snapshot.data[itemIndex].posterPath}"),
        ),
      ),
    );
  }
}
