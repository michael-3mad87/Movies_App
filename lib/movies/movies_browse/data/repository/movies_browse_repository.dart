import 'package:movies_app/movies/movies_browse/data/data_source/movies_browse_data_source.dart';
import 'package:movies_app/movies/movies_browse/data/models/movies_browse.dart';

class MoviesBrowseRepository {
  MoviesBowseDataSource moviesBowseDataSource;

  MoviesBrowseRepository(this.moviesBowseDataSource);
  Future<List<BrowseMovies>> getBrowseMovies(int categoryId) async {
    return moviesBowseDataSource.getBrowseMovies(categoryId);
  }
}
