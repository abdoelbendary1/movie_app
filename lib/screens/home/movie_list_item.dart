import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/movies/top_gun.png",
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Movie Name"),
            ],
          ),
        ],
      ),
    );
  }
}
