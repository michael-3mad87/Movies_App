import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

class RecommendedRepository {
  RecommendedAPIDataSource recommendedDataSource;
  RecommendedRepository(this.recommendedDataSource);
  Future<List<RecommendedMovies>> getRecommendedMovies() async {
    return recommendedDataSource.getRecommendedMovies();
  }
}
