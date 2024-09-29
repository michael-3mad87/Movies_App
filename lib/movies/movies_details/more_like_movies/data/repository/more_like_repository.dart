import 'package:movies_app/movies/movies_details/more_like_movies/data/data_source/more_like_data_source.dart';
import 'package:movies_app/shared/moviesMain.dart';

class MoreLikeRepository {
  MoreLikeMoviesAPIDataSource moreLikeMoviesAPIDataSource;
  MoreLikeRepository(this.moreLikeMoviesAPIDataSource);
  Future<List<MoviesMain>> getMoreMovies(int movieId) async {
    return moreLikeMoviesAPIDataSource.getMoreMovies(movieId);
  }
}
