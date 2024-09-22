import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/movies/movies_browse/data/model/CategoriesResponse.dart';

class CategoriesDatasource {
  Future<categoriesResponse> getcategories() async {
    try {
      final url =
          Uri.parse('https://${ApiConstant.baseUrl}/3/genre/movie/list');

      final response = await http.get(url, headers: {
        'Authorization': ApiConstant.token,
        'accept': ApiConstant.accept,
      });
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return categoriesResponse.fromJson(json);
      } else {
        throw Exception('failed to get movies like this ');
      }
    } catch (e) {
      throw Exception('failed to get movies');
    }
  }
}
