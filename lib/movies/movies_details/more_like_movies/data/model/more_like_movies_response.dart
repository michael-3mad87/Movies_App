import 'package:movies_app/shared/moviesMain.dart';

class MoreLikeMoviesResponse {
  int? page;
  List<MoviesMain>? results;
  int? totalPages;
  int? totalResults;

  MoreLikeMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoreLikeMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MoviesMain>[];
      json['results'].forEach((v) {
        results!.add(MoviesMain.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
