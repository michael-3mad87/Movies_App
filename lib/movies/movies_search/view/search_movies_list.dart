import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'widget/searched_movie_item.dart';
import '../view_model/search_tab_view_model.dart';

class SearchedMovieList extends StatefulWidget {
  const SearchedMovieList({super.key});

  @override
  State<SearchedMovieList> createState() => _SearchedMovieListState();
}

class _SearchedMovieListState extends State<SearchedMovieList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchTabViewModel>(context);
    return ListView.separated(
      itemCount: provider.movies.length,
      itemBuilder: (context, index) {
        return SearchedMovieItem(movie: provider.movies[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        color: Colors.grey,
        width: double.infinity,
        height: 2.h,
      ),
    );
  }
}
