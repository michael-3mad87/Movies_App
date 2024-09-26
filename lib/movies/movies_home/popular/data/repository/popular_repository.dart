import 'package:movies_app/movies/movies_home/popular/data/data_source/popular_movies_data_source.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/movies.dart';

class PopularRepository {
  PopularMoviesAPIDataSource popularMoviesAPIDataSource;
  PopularRepository(this.popularMoviesAPIDataSource);
  Future<List<MoviesPopular>> getPopularMovies() async {
    return popularMoviesAPIDataSource.getPopularMovies();
  }
}
