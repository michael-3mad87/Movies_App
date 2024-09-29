import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommendedMovies_response.dart';
import 'package:movies_app/shared/moviesMain.dart';

class RecommendedAPIDataSource {
  Future<List<MoviesMain>> getRecommendedMovies() async {
    final url = Uri.parse('https://${ApiConstant.baseUrl}/3/movie/top_rated');
    try {
      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final recommendResponse = RecommendedMoviesResponse.fromJson(json);
        if (recommendResponse.results!.isNotEmpty &&
            recommendResponse.results != null) {
          return recommendResponse.results ?? [];
        } else {
          throw Exception('failed to load recommended movies');
        }
      } else {
        throw Exception(
            'Failed to load popular movies. Status: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
