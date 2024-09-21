import 'package:flutter/material.dart';


import 'package:movies_app/movies/movies_details/movie_details/data/model/movie_details_response/movie_details_response.dart';
import 'package:movies_app/movies/movies_details/movie_details/data/repository/movie_details_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  String? errorMessage;
  bool isLoading = false;
  MovieDetailsResponse? movieDetailsResponse;
  MovieDetailsRepository repository;
  MovieDetailsViewModel() : repository = MovieDetailsRepository(ServicesLocator.moviesDetailsDataSource);

  Future<void> getMoviesDetails(int movieId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
       movieDetailsResponse = await repository.getMoviesDetails(movieId);
     
    } catch (e) {
      errorMessage = 'Failed to load movie details: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
  }
}
