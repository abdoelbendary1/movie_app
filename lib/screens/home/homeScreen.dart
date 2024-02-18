import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/movie_list_item.dart';
import 'package:movie_app/screens/login/login.dart';
import 'package:movie_app/theme/appTheme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(backgroundColor: AppTheme.redLightColor, actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
      ]),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: buildMainMovie(),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: buildMovieTypeList(),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: buildMovieTypeList(),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: buildMovieTypeList(),
          ),
        ],
      ),
    );
  }
}

class buildMovieTypeList extends StatelessWidget {
  const buildMovieTypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Special For you",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: MovieListItem(),
                          ),
                      separatorBuilder: (context, index) =>
                          const VerticalDivider(
                            thickness: 10,
                            color: Colors.transparent,
                          ),
                      itemCount: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class buildMainMovie extends StatelessWidget {
  const buildMainMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/movies/top_gun.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Movie Name",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sub label",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(4.5)",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
