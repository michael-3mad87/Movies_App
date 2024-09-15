import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/data/models/newRealse_movies_response.dart';

class NewrleaseDataSource {
  Future<newRealse_movies_response> getNewRleasemovies() async {
    try {
      final uri = Uri.parse('https://api.themoviedb.org/3/movie/upcoming');
      final response = await http.get(uri, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return newRealse_movies_response.fromJson(json);
      } else {
        throw Exception('failed to load movies');
      }
    } on Exception catch (error) {
      throw Exception('failed to load movies');
    }
  }
}
