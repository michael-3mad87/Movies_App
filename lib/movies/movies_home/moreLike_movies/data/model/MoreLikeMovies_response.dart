import 'package:movies_app/movies/movies_home/moreLike_movies/data/model/moreLikeMovies.dart';

class MoreLikeMovies_response {
  int? page;
  List<moreLikeMovies>? results;
  int? totalPages;
  int? totalResults;

  MoreLikeMovies_response(
      {this.page, this.results, this.totalPages, this.totalResults});

  MoreLikeMovies_response.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <moreLikeMovies>[];
      json['results'].forEach((v) {
        results!.add(new moreLikeMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
