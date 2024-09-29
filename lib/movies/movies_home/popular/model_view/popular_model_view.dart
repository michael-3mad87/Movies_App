import 'package:flutter/material.dart';

import 'package:movies_app/movies/movies_home/popular/data/repository/popular_repository.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/services_locator.dart';

class PopularModelView extends ChangeNotifier {
  PopularRepository repository;
  bool isLoading = false;
  List<MoviesMain> popularMovies = [];
  String? errorMessage;

  PopularModelView()
      : repository = PopularRepository(ServicesLocator.popularDataSource) {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      popularMovies = await repository.getPopularMovies();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
