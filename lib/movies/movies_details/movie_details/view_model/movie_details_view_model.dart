import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_details/movie_details/data/data_source/movies_details_data_source.dart';
import 'package:movies_app/movies/movies_details/movie_details/data/model/movie_details_response/movie_details_response.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  String? errorMessage;
  bool isLoading = false;
  MovieDetailsResponse? movieDetailsResponse;
  MoviesDetailsDataSource dataSource = MoviesDetailsDataSource();

  Future<void> getMoviesDetails(int movieId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await dataSource.getMoviesDetails(movieId);
      if (response != null) {
        movieDetailsResponse = response;
      } else {
        errorMessage = 'Failed to get movie details';
      }
    } catch (e) {
      errorMessage = 'Failed to load movie details: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
  }
}
