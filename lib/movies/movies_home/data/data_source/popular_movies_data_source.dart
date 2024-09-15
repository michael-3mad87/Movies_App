import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/movies/movies_home/data/models/popular_movies_response.dart';

class PopularMoviesDataSource {
  Future<PopularMoviesResponse> getPopularMovies() async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZGM1ZmU0NzAxYjRiZDlkZmZhNDBjMzU5YTUwYzFhOCIsIm5iZiI6MTcyNjMxMzEzNi44NzU2OTYsInN1YiI6IjY2ZTU2YmNlZjNkM2Y4YmZmOTZkODNmNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wJoLEi8gocnRFoKiw6ZAKlK0odFbSFoqQlPWs8e3SQs',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return PopularMoviesResponse.fromJson(json);
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
