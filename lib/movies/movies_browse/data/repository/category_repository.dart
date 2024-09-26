import 'package:movies_app/movies/movies_browse/data/data_source/moviesBrowse_dataSource.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';

class CategoryRepository {
  CategoriesDatasource categoriesDatasource;
  CategoryRepository(this.categoriesDatasource);
  Future<List<categories>> getcategories() async {
    return categoriesDatasource.getcategories();
  }
}
