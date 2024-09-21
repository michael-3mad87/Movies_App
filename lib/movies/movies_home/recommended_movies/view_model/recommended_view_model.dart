import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/repository/recommended_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class RecommendedViewModel extends ChangeNotifier {
<<<<<<< HEAD
  RecommendedRepository repository;
=======
  RecommendedViewModel() {
<<<<<<< HEAD
    getRecommendedmovies();
  }

  final datasource = RecommendedDatasource();
  bool isloading = false;
  String? errormessage;
  List<recommended_movies> recommend_movies = [];

  Future<void> getRecommendedmovies() async {
    isloading = true;
    notifyListeners();
    try {
      final response = await datasource.getRecommendedmovies();
      if (response.results!.isNotEmpty && response.results != null) {
        recommend_movies = response.results!;
      } else {
        errormessage = 'Failed to get movies';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
=======
    getRecommendedMovies();
  }

  final dataSource = RecommendedDataSource();
>>>>>>> 0af5516cb4e95e44fdd16c4ad02f378145ee98cc
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
>>>>>>> origin/feature/home
    notifyListeners();
  }
}
