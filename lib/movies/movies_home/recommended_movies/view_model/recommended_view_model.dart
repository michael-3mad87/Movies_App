import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/repository/recommended_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class RecommendedViewModel extends ChangeNotifier {
  RecommendedRepository repository;
  bool isLoading = false;
  String? errorMessage;
  List<RecommendedMovies> recommendMovies = [];
  RecommendedViewModel()
      : repository =
            RecommendedRepository(ServicesLocator.recommendedDataSource) {
    getRecommendedMovies();
  }
  Future<void> getRecommendedMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      recommendMovies = await repository.getRecommendedMovies();
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
