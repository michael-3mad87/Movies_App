import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/repository/recommend_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class RecommendedViewModel extends ChangeNotifier {

  RecommendRepository repository;
   RecommendedViewModel() :repository = RecommendRepository(ServicesLocator.recommendedDataSource){
    getRecommendedMovies();
  }
  bool isLoading = false;
  String? errorMessage;
  List<RecommendedMovies> recommendMovies = [];

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
