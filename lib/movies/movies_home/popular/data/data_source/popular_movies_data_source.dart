import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/popular_movies_response.dart';
import 'package:movies_app/shared/moviesMain.dart';

class PopularMoviesAPIDataSource {
  Future<List<MoviesMain>> getPopularMovies() async {
    try {
      final uri = Uri.parse(
          'https://${ApiConstant.baseUrl}/3/movie/popular?language=en-US&page=1');
      final response = await http.get(
        uri,
        headers: {
          'Authorization': ApiConstant.token,
          'accept': ApiConstant.accept,
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final popularResponse = PopularMoviesResponse.fromJson(json);
        if (popularResponse.movies != null &&
            popularResponse.movies!.isNotEmpty) {
          return popularResponse.movies ?? [];
        } else {
          throw Exception('failed to get popular movies');
        }
      } else {
        throw Exception(
            'Failed to load popular movies. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in getPopularMovies: $e');
      rethrow;
    }
  }
}
