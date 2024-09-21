// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/movies/movies_home/popular/data/data_source/popular_movies_data_source.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/movies.dart';

class PopularRepository {
  PopularMoviesAPIDataSource popularMoviesDataSource;
  PopularRepository(
    this.popularMoviesDataSource,
  );
  Future<List<MoviesPopular>> getPopularMovies() async {
    return popularMoviesDataSource.getPopularMovies();
  }
}
