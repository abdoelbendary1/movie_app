import 'dart:convert';

import 'package:movie_app/models/constants.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class API {
  static const _trendingURL =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static const _topRatedURL =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedURL));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static const _upcomingURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getupcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingURL));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static const _popularURL =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_topRatedURL));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }
}
