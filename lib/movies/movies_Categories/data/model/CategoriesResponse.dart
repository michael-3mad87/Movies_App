import 'package:movies_app/movies/movies_Categories/data/model/categories.dart';

class categoriesResponse {
  List<categories>? genres;

  categoriesResponse({this.genres});

  categoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <categories>[];
      json['genres'].forEach((v) {
        genres!.add(categories.fromJson(v));
      });
    }
  }
}
