import 'dart:convert';
import 'package:movies_app/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/movies/movies_details/movie_details/data/model/movie_details_response/movie_details_response.dart';

class MoviesDetailsDataSource {
  Future<MovieDetailsResponse?> getMoviesDetails(int movieId) async {
    try {
      final uri = Uri.parse(
          'https://${ApiConstant.baseUrl}/3/movie/$movieId?language=en-US');
      final response = await http.get(
        uri,
        headers: {
          'Authorization': ApiConstant.token,
          'accept': ApiConstant.accept,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MovieDetailsResponse.fromJson(json);
      } else {
        throw Exception(
            'Failed to load movie details. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in getMoviesDetails: $e');
      rethrow;
    }
  }
}
