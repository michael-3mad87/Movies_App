import 'package:movies_app/movies/movies_details/more_like_movies/data/data_source/more_like_data_source.dart';
import 'package:movies_app/movies/movies_details/movie_details/data/data_source/movies_details_data_source.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/data_source/new_releases%20_data_source.dart';
import 'package:movies_app/movies/movies_home/popular/data/data_source/popular_movies_data_source.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';

class ServicesLocator {
  static PopularMoviesAPIDataSource popularDataSource =
      PopularMoviesAPIDataSource();
  static RecommendedAPIDataSource recommendedDataSource =
      RecommendedAPIDataSource();
  static NewReleasesAPIDataSource newReleasesDataSource =
      NewReleasesAPIDataSource();
  static MoreLikeMoviesAPIDataSource moreLikeMoviesDataSource =
      MoreLikeMoviesAPIDataSource();
  static MoviesDetailsAPIDataSource moviesDetailsDataSource =
      MoviesDetailsAPIDataSource();
}
