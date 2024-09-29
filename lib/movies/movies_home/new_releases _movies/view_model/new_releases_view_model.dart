import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/repository/new_releases_repository.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/services_locator.dart';

class NewReleasesViewModel extends ChangeNotifier {
  NewReleasesRepository repository;
  NewReleasesViewModel()
      : repository =
            NewReleasesRepository(ServicesLocator.newReleasesDataSource) {
    getReleasesMovies();
  }
  bool isLoading = false;
  List<MoviesMain> releasesMovies = [];
  String? errorMessage;

  Future<void> getReleasesMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      releasesMovies = await repository.getNewReleasesMovies();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
