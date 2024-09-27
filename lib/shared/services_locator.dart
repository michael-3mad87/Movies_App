import 'package:movies_app/movies/movies_Categories/data/data_source/categories_data_source.dart';
import 'package:movies_app/movies/movies_browse/data/data_source/movies_browse_data_source.dart';
import 'package:movies_app/movies/movies_details/more_like_movies/data/data_source/more_like_data_source.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/data_source/new_releases%20_data_source.dart';
import 'package:movies_app/movies/movies_home/popular/data/data_source/popular_movies_data_source.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/data_source/recommended_dataSource.dart';

import '../movies/movies_search/data/data_source/search_tab_api_data_source.dart';

class ServicesLocator {
  static final searchSource = SearchTabAPIDataSource();
  static final popularDataSource = PopularMoviesAPIDataSource();
  static final recommendedDataSource = RecommendedAPIDataSource();
  static final newReleasesDataSource = NewReleasesAPIDataSource();
  static final moreLikeDataSource = MoreLikeMoviesAPIDataSource();
  static final categoriesDatasource = CategoriesDatasource();
  static final moviesBowseDataSource = MoviesBowseDataSource();
}
