import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

class recommendedMovies_response {
  int? page;
  List<recommended_movies>? results;
  int? totalPages;
  int? totalResults;

  recommendedMovies_response(
      {this.page, this.results, this.totalPages, this.totalResults});

  recommendedMovies_response.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <recommended_movies>[];
      json['results'].forEach((v) {
        results!.add(new recommended_movies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
