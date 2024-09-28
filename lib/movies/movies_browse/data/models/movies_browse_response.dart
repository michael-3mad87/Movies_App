import 'package:movies_app/movies/movies_browse/data/models/movies_browse.dart';

class MoviesBrowseResponse {
  int? page;
  List<BrowseMovies>? results;
  int? totalPages;
  int? totalResults;

  MoviesBrowseResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoviesBrowseResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <BrowseMovies>[];
      json['results'].forEach((v) {
        results!.add(new BrowseMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
