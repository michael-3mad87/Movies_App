import 'package:movies_app/shared/moviesMain.dart';

class SearchResultResponse {
  SearchResultResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<MoviesMain> movies;
  late final int totalPages;
  late final int totalResults;

  SearchResultResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    movies =
        List.from(json['results']).map((e) => MoviesMain.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
