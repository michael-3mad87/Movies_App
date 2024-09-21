import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

class RecommendedMoviesResponse {
  int? page;
  List<RecommendedMovies>? results;
  int? totalPages;
  int? totalResults;

  RecommendedMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  RecommendedMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <RecommendedMovies>[];
      json['results'].forEach((v) {
        results!.add(RecommendedMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
