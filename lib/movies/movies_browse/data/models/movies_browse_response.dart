import 'package:movies_app/shared/moviesMain.dart';

class MoviesBrowseResponse {
  int? page;
  List<MoviesMain>? results;
  int? totalPages;
  int? totalResults;

  MoviesBrowseResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoviesBrowseResponse.fromJson(Map<String, dynamic> json) {
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
