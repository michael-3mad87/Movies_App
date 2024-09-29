import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_watchlist/watchlist_tap/FirerBase_Utils.dart';
import 'package:movies_app/shared/moviesMain.dart';

class WatchListViewModel extends ChangeNotifier {
  List<MoviesMain> _movies = [];
  bool iswatchlist = false;
  List<MoviesMain> get movies => _movies;

  WatchListViewModel() {
    fetchMovies();
    getiswathc();
  }

  Future<void> fetchMovies() async {
    _movies = await FirebaseUtils.getWatchListMovies();
    notifyListeners();
  }

  void getiswathc() {
    iswatchlist = true;
    notifyListeners();
  }
}
