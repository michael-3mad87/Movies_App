import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/popular_movies_response.dart';

class PopularMoviesDataSource {
  Future<PopularMoviesResponse> getPopularMovies() async {
  try {
    final uri = Uri.parse('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': ApiConstant.token,
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PopularMoviesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load popular movies. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception in getPopularMovies: $e');
    rethrow;
  }
}
}
