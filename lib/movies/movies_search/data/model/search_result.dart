import '../../../movies_home/popular/data/models/movies.dart';

class SearchResultResponse {
  SearchResultResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<MoviesPopular> movies;
  late final int totalPages;
  late final int totalResults;

  SearchResultResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    movies = List.from(json['results'])
        .map((e) => MoviesPopular.fromJson(e))
        .toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
