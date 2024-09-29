import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/models/new_releases%20_movies_response.dart';
import 'package:movies_app/shared/moviesMain.dart';

class NewReleasesAPIDataSource {
  Future<List<MoviesMain>> getNewReleasesMovies() async {
    try {
      final uri = Uri.parse('https://${ApiConstant.baseUrl}/3/movie/upcoming');
      final response = await http.get(uri, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final releasesResponse = NewReleasesMoviesResponse.fromJson(json);
        if (releasesResponse.results!.isNotEmpty &&
            releasesResponse.results != null) {
          return releasesResponse.results ?? [];
        } else {
          throw Exception('failed to load releases movies');
        }
      } else {
        throw Exception(
            'Failed to load popular movies. Status: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('failed to load movies ${e.toString()}');
    }
  }
}
