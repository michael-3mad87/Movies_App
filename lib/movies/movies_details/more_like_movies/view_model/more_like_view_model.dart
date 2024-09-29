import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_details/more_like_movies/data/repository/more_like_repository.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/services_locator.dart';

class MoreLikeViewModel extends ChangeNotifier {
  MoreLikeRepository repository;

  MoreLikeViewModel(this.movieId)
      : repository = MoreLikeRepository(ServicesLocator.moreLikeDataSource) {
    getLikeMoreMovies();
  }
  int movieId;
  bool isLoading = false;
  List<MoviesMain> moreMovies = [];
  String? errorMessage;
  Future<void> getLikeMoreMovies() async {
    isLoading = true;
    notifyListeners();
    try {
      moreMovies = await repository.getMoreMovies(movieId);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
