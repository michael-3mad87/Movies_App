import 'package:movies_app/shared/moviesMain.dart';

abstract class SearchTabDataSource {
  Future<List<MoviesMain>> getSearchResult(String query,
      {String language = "language", int page = 1});
}
