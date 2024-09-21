import 'package:movies_app/movies/movies_details/movie_details/data/data_source/movies_details_data_source.dart';
import 'package:movies_app/movies/movies_details/movie_details/data/model/movie_details_response/movie_details_response.dart';

class MovieDetailsRepository {
  MoviesDetailsAPIDataSource moviesDetailsDataSource;
  MovieDetailsRepository(this.moviesDetailsDataSource);
  Future<MovieDetailsResponse?> getMoviesDetails(int movieId) async {
    return moviesDetailsDataSource.getMoviesDetails(movieId);
  }
}
