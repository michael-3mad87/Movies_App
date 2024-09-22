import 'package:movies_app/movies/movies_browse/data/model/categories.dart';

class categoriesResponse {
  List<categories>? genres;

  categoriesResponse({this.genres});

  categoriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <categories>[];
      json['genres'].forEach((v) {
        genres!.add(new categories.fromJson(v));
      });
    }
  }
}
