import 'package:movies_app/shared/moviesMain.dart';

class PopularMoviesResponse {
  int? page;
  List<MoviesMain>? movies;
  int? totalPages;
  int? totalResults;

  PopularMoviesResponse(
      {this.page, this.movies, this.totalPages, this.totalResults});

  PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movies = <MoviesMain>[];
      json['results'].forEach((v) {
        movies!.add(MoviesMain.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
