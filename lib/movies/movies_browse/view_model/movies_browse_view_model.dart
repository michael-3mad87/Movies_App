import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_browse/data/repository/movies_browse_repository.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/services_locator.dart';

class MoviesBrowseViewModel extends ChangeNotifier {
  MoviesBrowseViewModel(int categoryId)
      : repository =
            MoviesBrowseRepository(ServicesLocator.moviesBowseDataSource) {
    getBrowseMovies(categoryId);
  }
  bool isLoading = false;
  List<MoviesMain> browseMovies = [];
  String? errorMessage;
  MoviesBrowseRepository repository;

  Future<void> getBrowseMovies(int categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      browseMovies = await repository.getBrowseMovies(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
