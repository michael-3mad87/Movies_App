import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_Categories/data/model/categories.dart';
import 'package:movies_app/movies/movies_Categories/data/repository/category_repository.dart';
import 'package:movies_app/shared/services_locator.dart';

class CategoriesViewmodel extends ChangeNotifier {
  CategoriesViewmodel()
      : repository = CategoryRepository(ServicesLocator.categoriesDatasource) {
    getcategories();
  }
  bool isLoading = false;
  List<categories> categoires = [];
  String? errorMessage;
  CategoryRepository repository;

  Future<void> getcategories() async {
    isLoading = true;
    notifyListeners();

    try {
      categoires = await repository.getcategories();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
