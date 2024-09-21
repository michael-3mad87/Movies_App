import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommendedMovies_response.dart';

<<<<<<< HEAD
class RecommendedDatasource {
  Future<recommendedMovies_response> getRecommendedmovies() async {
=======
class RecommendedDataSource {
  Future<RecommendedMoviesResponse> getRecommendedMovies() async {
>>>>>>> origin/feature/home
    final url = Uri.parse('https://api.themoviedb.org/3/movie/top_rated');
    try {
      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
<<<<<<< HEAD
        return recommendedMovies_response.fromJson(json);
=======
        return RecommendedMoviesResponse.fromJson(json);
>>>>>>> origin/feature/home
      } else {
        throw Exception('failed to load recommended movies');
      }
    } catch (e) {
      rethrow;
    }
  }
}
