import '../../../movies_home/popular/data/models/movies.dart';

abstract class SearchTabDataSource{
  Future<List<Movies>> getSearchResult(String query,{String language = "language",int page =1});
}