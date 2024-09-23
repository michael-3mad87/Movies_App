import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../movies_search/searched_movie_item/searched_movie_item.dart';
import '../../movies_search/view_model/search_tab_view_model.dart';

class WatchListScreen extends StatefulWidget {
 const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _SearchedMovieListState();
}

class _SearchedMovieListState extends State<WatchListScreen> {
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
        height: 2,
      ),
    );
  }
}
