import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/movies/movies_search/data/data_source/search_tab_data_source.dart';

import '../../../../data/search_result.dart';
import '../../../movies_home/popular/data/models/movies.dart';


class SearchTabAPIDataSource extends SearchTabDataSource{

  @override
  Future<List<Movies>> getSearchResult(String query,{String language = "language",int page =1})async{
    final uri = Uri.https(
        "api.themoviedb.org",
        "3/search/movie",
        {
          "query":query,
          "include_adult" :"false",
          "language" : language,
          "page" : page.toString(),
        }
    );
    final response = await http.get(
        uri,
        headers: {
          'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZGM1ZmU0NzAxYjRiZDlkZmZhNDBjMzU5YTUwYzFhOCIsIm5iZiI6MTcyNjMxMzEzNi44NzU2OTYsInN1YiI6IjY2ZTU2YmNlZjNkM2Y4YmZmOTZkODNmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wJoLEi8gocnRFoKiw6ZAKlK0odFbSFoqQlPWs8e3SQs',

        }
    );
    final json = jsonDecode(response.body);
    final searchResult= SearchResult.fromJson(json);
    return searchResult.movies;
  }

}