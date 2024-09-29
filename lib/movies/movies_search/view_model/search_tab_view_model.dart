import 'package:flutter/cupertino.dart';
import 'package:movies_app/shared/moviesMain.dart';

import '../data/repository/search_tab_repository.dart';

class SearchTabViewModel with ChangeNotifier {
  final repo = SearchTabRepository();
  List<MoviesMain> movies = [];

  Future<void> changeMovies(String query) async {
    try {
      movies = await repo.getSearchResult(query);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
