import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommendedMovies_response.dart';

class RecommendedDatasource {
  Future<recommendedMovies_response> getRecommendedmovies() async {
    final url = Uri.parse('https://api.themoviedb.org/3/movie/top_rated');
    try {
      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return recommendedMovies_response.fromJson(json);
      } else {
        throw Exception('failed to load recommended movies');
      }
    } catch (e) {
      rethrow;
    }
  }
}
