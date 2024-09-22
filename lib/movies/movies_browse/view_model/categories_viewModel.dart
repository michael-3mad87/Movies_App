import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_browse/data/data_source/moviesBrowse_dataSource.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';

class CategoriesViewmodel extends ChangeNotifier {
  bool isLoading = false;
  List<categories> categoires = [];
  String? errorMessage;
  final dataSource = CategoriesDatasource();

  Future<void> getcategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getcategories();
      if (response.genres!.isNotEmpty && response.genres != null) {
        categoires = response.genres!;
      } else {
        errorMessage = 'failed to get categories';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
