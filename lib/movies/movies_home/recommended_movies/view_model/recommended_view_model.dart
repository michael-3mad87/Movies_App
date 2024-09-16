import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

class RecommendedViewModel extends ChangeNotifier {
  RecommendedViewModel() {
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
    notifyListeners();
  }
}
