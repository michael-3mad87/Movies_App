import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/shared/moviesMain.dart';

class RecommendRepository {
  RecommendedAPIDataSource recommendedAPIDataSource;
  RecommendRepository(this.recommendedAPIDataSource);
  Future<List<MoviesMain>> getRecommendedMovies() async {
    return recommendedAPIDataSource.getRecommendedMovies();
  }
}
