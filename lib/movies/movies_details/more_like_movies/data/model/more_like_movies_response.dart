import 'package:movies_app/movies/movies_details/more_like_movies/data/model/more_like_movies.dart';

class MoreLikeMoviesResponse {
  int? page;
  List<MoreLikeMovies>? results;
  int? totalPages;
  int? totalResults;

  MoreLikeMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoreLikeMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MoreLikeMovies>[];
      json['results'].forEach((v) {
        results!.add(new MoreLikeMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
