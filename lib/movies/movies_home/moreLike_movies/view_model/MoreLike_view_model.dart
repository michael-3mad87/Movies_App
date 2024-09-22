import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/data/data_source/moreLike_DataSource.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/data/model/moreLikeMovies.dart';

class MorelikeViewModel extends ChangeNotifier {
  MorelikeViewModel(this.movieId) {
    getLikeMoreMovies();
  }
  int movieId;
  bool isLoading = false;
  List<moreLikeMovies> moreMovies = [];
  String? errorMessage;
  final dataSource = MorelikeMoviesDatasource();
  Future<void> getLikeMoreMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getMoreMovies(movieId);
      if (response.results!.isNotEmpty && response.results != null) {
        moreMovies = response.results!;
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
