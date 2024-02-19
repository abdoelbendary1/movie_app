import 'package:flutter/material.dart';
import 'package:movie_app/screens/Movie/movieCategory.dart';
import 'package:movie_app/screens/Search/searchMovie.dart';
import 'package:movie_app/theme/appTheme.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //searchbar
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.08,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: TextField(
          //       controller: searchController,
          //       style: TextStyle(
          //           color: AppTheme.blackDarkColor,
          //           fontWeight: FontWeight.bold),
          //       decoration: InputDecoration(
          //         prefixIcon: Icon(Icons.search),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         filled: true,
          //         fillColor: AppTheme.whiteColor,
          //         hintText: "Search",
          //         hintStyle:
          //             TextStyle(color: AppTheme.blackDarkColor, fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 20,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieSearchScreen.routeName);
                    },
                    child: Center(
                        child: Text(
                      "Action",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieSearchScreen.routeName);
                    },
                    child: Center(
                        child: Text(
                      "Drama",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieSearchScreen.routeName);
                    },
                    child: Center(
                        child: Text(
                      "Romance",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieSearchScreen.routeName);
                    },
                    child: Center(
                        child: Text(
                      "Thriller",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
