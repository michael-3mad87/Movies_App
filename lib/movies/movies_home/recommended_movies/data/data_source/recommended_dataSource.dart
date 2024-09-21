import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommendedMovies_response.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';

<<<<<<< HEAD
class RecommendedAPIDataSource {
  Future<List<RecommendedMovies>> getRecommendedMovies() async {
=======
<<<<<<< HEAD
class RecommendedDatasource {
  Future<recommendedMovies_response> getRecommendedmovies() async {
=======
class RecommendedDataSource {
  Future<RecommendedMoviesResponse> getRecommendedMovies() async {
>>>>>>> origin/feature/home
>>>>>>> 0af5516cb4e95e44fdd16c4ad02f378145ee98cc
    final url = Uri.parse('https://api.themoviedb.org/3/movie/top_rated');
    try {
      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
<<<<<<< HEAD
        final recommendResponse = RecommendedMoviesResponse.fromJson(json);
        if (recommendResponse.results!.isNotEmpty &&
            recommendResponse.results != null) {
          return recommendResponse.results ?? [];
        } else {
          throw Exception('failed to load recommended movies');
        }
=======
<<<<<<< HEAD
        return recommendedMovies_response.fromJson(json);
=======
        return RecommendedMoviesResponse.fromJson(json);
>>>>>>> origin/feature/home
>>>>>>> 0af5516cb4e95e44fdd16c4ad02f378145ee98cc
      } else {
        throw Exception(
            'Failed to load popular movies. Status: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
