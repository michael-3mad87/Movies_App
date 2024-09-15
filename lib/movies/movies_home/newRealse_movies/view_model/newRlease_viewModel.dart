import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/data/data_source/newRlease_data_source.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/data/models/newRealse_movies.dart';

class NewrleaseMoviesViewmodel extends ChangeNotifier {
  NewrleaseMoviesViewmodel() {
    getRealseMovies();
  }
  bool isLoading = false;
  List<newRealse_movie> realsesMovies = [];
  String? errorMessage;
  final dataSource = NewrleaseDataSource();

  Future<void> getRealseMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getNewRleasemovies();
      if (response.results!.isNotEmpty && response.results != null) {
        realsesMovies = response.results!;
      } else {
        errorMessage = 'Failed to get movies';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
