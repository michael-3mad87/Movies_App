import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/data_source/new_releases%20_data_source.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/models/new_releases_movies.dart';

class NewReleasesViewModel extends ChangeNotifier {
  NewReleasesViewModel() {
    getReleasesMovies();
  }
  bool isLoading = false;
  List<NewReleasesMovie> releasesMovies = [];
  String? errorMessage;
  final dataSource = NewReleasesDataSource();

  Future<void> getReleasesMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getNewReleasesMovies();
      if (response.results!.isNotEmpty && response.results != null) {
        releasesMovies = response.results!;
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
