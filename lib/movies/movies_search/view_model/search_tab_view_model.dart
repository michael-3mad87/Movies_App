import 'package:flutter/cupertino.dart';

import '../../movies_home/popular/data/models/movies.dart';
import '../data/repository/search_tab_repository.dart';

class SearchTabViewModel with ChangeNotifier{
  final repo = SearchTabRepository();
  List<Movies> movies = [];

  Future<void> changeMovies(String query)async{
    try{
      movies = await repo.getSearchResult(query);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }

}