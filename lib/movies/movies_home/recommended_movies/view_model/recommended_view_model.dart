import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

class RecommendedViewModel extends ChangeNotifier {
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
  bool isLoading = false;
  String? errorMessage;
  List<RecommendedMovies> recommendMovies = [];

  Future<void> getRecommendedMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getRecommendedMovies();
      if (response.results!.isNotEmpty && response.results != null) {
        recommendMovies = response.results!;
      } else {
        errorMessage = 'Failed to get movies';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
>>>>>>> origin/feature/home
    notifyListeners();
  }
}
