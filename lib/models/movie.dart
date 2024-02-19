class Movie {
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? backdropPath;
  double? voteAverage;
  String? releaseDate;
  Movie({
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] as String,
      originalTitle: json["original_title"] as String,
      overview: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      backdropPath: json["backdrop_path"] as String,
      voteAverage: json["vote_average"],
      releaseDate: json["release_date"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "original_title": originalTitle,
      "overview": overview,
      "poster_path": posterPath,
      "backdrop_path": backdropPath,
      "vote_average": voteAverage,
      "release_date": releaseDate,
    };
  }
}


// 20240219003808
// https://api.themoviedb.org/3/trending/movie/day?api_key=28751eb2e6d1a7568a733f8956d47ed4

