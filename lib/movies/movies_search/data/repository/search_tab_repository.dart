
import '../../../../shared/sources_locator.dart';
import '../../../movies_home/popular/data/models/movies.dart';

class SearchTabRepository{
  final searchTabDataSource =SourcesLocator.searchSource;

  Future<List<MoviesPopular>> getSearchResult(String query,{String language = "language",int page =1})async{

    return searchTabDataSource.getSearchResult(query);

  }
}