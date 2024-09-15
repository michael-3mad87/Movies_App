import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/data/data_source/popular_movies_data_source.dart';
import 'package:movies_app/movies/movies_home/data/models/movies.dart';

class PopularModelView extends ChangeNotifier {
  final dataSource = PopularMoviesDataSource();
  bool isLoading = false;
  List<Movies> popularMovies = [];
  String? errorMessage;
  Future<void> getPopularMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getPopularMovies();
      if (response.movies != null) {
        popularMovies = response.movies!;
      } else {
        errorMessage = 'failed to get movies';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
