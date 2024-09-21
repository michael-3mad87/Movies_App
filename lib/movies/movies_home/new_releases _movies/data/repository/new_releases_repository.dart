import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/data_source/new_releases%20_data_source.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/models/new_releases_movies.dart';

class NewReleasesRepository {
  NewReleasesAPIDataSource newReleasesAPIDataSource;
  NewReleasesRepository(this.newReleasesAPIDataSource);
  Future<List<NewReleasesMovie>> getNewReleasesMovies() async {
    return newReleasesAPIDataSource.getNewReleasesMovies();
  }
}
