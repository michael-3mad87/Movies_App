import 'dart:convert';

import 'package:movies_app/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/movies/movies_Categories/data/model/CategoriesResponse.dart';
import 'package:movies_app/movies/movies_Categories/data/model/categories.dart';

class CategoriesDatasource {
  Future<List<categories>> getcategories() async {
    final url = Uri.parse('https://${ApiConstant.baseUrl}/3/genre/movie/list');

    final response = await http.get(url, headers: {
      'Authorization': ApiConstant.token,
      'accept': ApiConstant.accept,
    });

    final json = jsonDecode(response.body);
    final categoryResponse = categoriesResponse.fromJson(json);
    if (categoryResponse.genres!.isNotEmpty &&
        categoryResponse.genres != null) {
      return categoryResponse.genres!;
    } else {
      throw Exception('failed to get categories');
    }
  }
}
