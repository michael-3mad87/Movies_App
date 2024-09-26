import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_browse/data/data_source/moviesBrowse_dataSource.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';

class CategoriesViewmodel extends ChangeNotifier {
  CategoriesViewmodel() {
    getcategories();
  }
  bool isLoading = false;
  List<categories> categoires = [];
  String? errorMessage;
  final dataSource = CategoriesDatasource();

  Future<void> getcategories() async {
    isLoading = true;
    notifyListeners();

    try {
      categoires = await dataSource.getcategories();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
