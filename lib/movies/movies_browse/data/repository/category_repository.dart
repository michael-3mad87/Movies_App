import 'package:movies_app/movies/movies_browse/data/data_source/categories_data_source.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';

class CategoryRepository {
  CategoriesDatasource categoriesDatasource;
  CategoryRepository(this.categoriesDatasource);
  Future<List<categories>> getcategories() async {
    return categoriesDatasource.getcategories();
  }
}
