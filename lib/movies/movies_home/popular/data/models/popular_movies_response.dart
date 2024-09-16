import 'package:movies_app/movies/movies_home/popular/data/models/movies.dart';

class PopularMoviesResponse {
  int? page;
  List<MoviesPopular>? movies;
  int? totalPages;
  int? totalResults;

  PopularMoviesResponse(
      {this.page, this.movies, this.totalPages, this.totalResults});

  PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <MoviesPopular>[];
      json['results'].forEach((v) {
        movies!.add(MoviesPopular.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
