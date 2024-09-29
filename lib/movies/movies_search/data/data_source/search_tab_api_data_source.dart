import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_search/data/data_source/search_tab_data_source.dart';
import 'package:movies_app/shared/moviesMain.dart';

import '../model/search_result.dart';

class SearchTabAPIDataSource extends SearchTabDataSource {
  @override
  Future<List<MoviesMain>> getSearchResult(String query,
      {String language = "language", int page = 1}) async {
    final uri = Uri.https("api.themoviedb.org", "3/search/movie", {
      "query": query,
      "include_adult": "false",
      "language": language,
      "page": page.toString(),
    });
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.token,
    });
    final json = jsonDecode(response.body);
    final searchResult = SearchResultResponse.fromJson(json);
    return searchResult.movies;
  }
}
