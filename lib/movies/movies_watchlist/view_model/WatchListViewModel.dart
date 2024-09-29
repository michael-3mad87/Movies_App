import 'package:flutter/material.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/movies/movies_watchlist/data/data_source/FirerBase_Utils.dart';

class WatchListViewModel extends ChangeNotifier {
  List<MoviesMain> _movies = [];

  List<MoviesMain> get movies => _movies;
  bool isloading = false;
  String? errorMessage;
  WatchListViewModel() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    isloading = true;
    notifyListeners();
    try {
      _movies = await FirebaseUtils.getWatchListMovies();
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
    }
    isloading = false;
    notifyListeners();
  }

  Future<void> removeMovieFromWatchList(int movieId) async {
    await FirebaseUtils.deleteMovieFromWatchList(movieId);
    _movies.removeWhere((movie) => movie.id == movieId);
    notifyListeners();
  }
}
