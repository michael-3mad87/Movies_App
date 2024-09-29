import 'package:movies_app/shared/moviesMain.dart';

import '../../../../shared/services_locator.dart';

class SearchTabRepository {
  final searchTabDataSource = ServicesLocator.searchSource;

  Future<List<MoviesMain>> getSearchResult(String query,
      {String language = "language", int page = 1}) async {
    return searchTabDataSource.getSearchResult(query);
  }
}
