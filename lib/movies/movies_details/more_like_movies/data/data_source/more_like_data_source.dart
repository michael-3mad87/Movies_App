import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_details/more_like_movies/data/model/more_like_movies.dart';
import 'package:movies_app/movies/movies_details/more_like_movies/data/model/more_like_movies_response.dart';

class MoreLikeMoviesAPIDataSource {
  Future<List<MoreLikeMovies>> getMoreMovies(int movieId) async {
    try {
      final url =
          Uri.parse('https://api.themoviedb.org/3/movie/$movieId/similar');

      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final moreLikeResponse = MoreLikeMoviesResponse.fromJson(json);
        if (moreLikeResponse.results!.isNotEmpty &&
            moreLikeResponse.results != null) {
          return moreLikeResponse.results ?? [];
        } else {
          throw Exception('failed to get movies like this ');
        }
      } else {
        throw Exception(
            'Failed to load popular movies. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('failed to load movies ${e.toString()}');
    }
  }
}
