import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/data/model/MoreLikeMovies_response.dart';

class MorelikeMoviesDatasource {
  Future<MoreLikeMovies_response> getMoreMovies(int movieId) async {
    try {
      final url =
          Uri.parse('https://api.themoviedb.org/3/movie/$movieId/similar');

      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MoreLikeMovies_response.fromJson(json);
      } else {
        throw Exception('failed to get movies like this ');
      }
    } catch (e) {
      throw Exception('failed to load movies ${e.toString()}');
    }
  }
}
