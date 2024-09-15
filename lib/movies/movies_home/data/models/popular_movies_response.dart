import 'package:movies_app/movies/movies_home/data/models/movies.dart';

class PopularMoviesResponse {
  int? page;
  List<Movies>? movies;
  int? totalPages;
  int? totalResults;

  PopularMoviesResponse({this.page, this.movies, this.totalPages, this.totalResults});

  PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <Movies>[];
      json['results'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
