import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_browse/data/models/movies_browse.dart';
import 'package:movies_app/movies/movies_browse/data/models/movies_browse_response.dart';

class MoviesBowseDataSource {
  Future<List<BrowseMovies>> getBrowseMovies(int categoryId) async {
    final url = Uri.parse(
        'https://${ApiConstant.baseUrl}/3/discover/movie?with_genres=$categoryId');

    final response = await http.get(url, headers: {
      'Authorization': ApiConstant.token,
      'accept': ApiConstant.accept,
    });
    final json = jsonDecode(response.body);
    final moviesResponse = MoviesBrowseResponse.fromJson(json);
    if (moviesResponse.results!.isNotEmpty && moviesResponse.results != null) {
      return moviesResponse.results!;
    } else {
      throw Exception('failed to get movies');
    }
  }
}
