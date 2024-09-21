import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/movies.dart';
import 'package:movies_app/movies/movies_home/popular/data/repository/popular_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class PopularViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<MoviesPopular> popularMovies = [];
  String? errorMessage;
  PopularRepository popularRepository;
  PopularViewModel():popularRepository = PopularRepository(ServicesLocator.popularDataSource) {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      popularMovies = await popularRepository.getPopularMovies();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
