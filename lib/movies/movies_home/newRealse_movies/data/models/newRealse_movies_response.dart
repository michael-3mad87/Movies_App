import 'package:movies_app/movies/movies_home/newRealse_movies/data/models/newRealse_movies.dart';

class newRealse_movies_response {
  int? page;
  List<newRealse_movie>? results;
  int? totalPages;
  int? totalResults;

  newRealse_movies_response(
      {this.page, this.results, this.totalPages, this.totalResults});

  newRealse_movies_response.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <newRealse_movie>[];
      json['results'].forEach((v) {
        results!.add(newRealse_movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
