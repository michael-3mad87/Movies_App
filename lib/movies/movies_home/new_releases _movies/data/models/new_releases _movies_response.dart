import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/models/new_releases_movies.dart';

class NewReleasesMoviesResponse {
  int? page;
  List<NewReleasesMovie>? results;
  int? totalPages;
  int? totalResults;

  NewReleasesMoviesResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  NewReleasesMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <NewReleasesMovie>[];
      json['results'].forEach((v) {
        results!.add(NewReleasesMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
