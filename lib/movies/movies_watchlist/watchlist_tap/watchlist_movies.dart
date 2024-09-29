// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/movies/movies_search/view/widget/searched_movie_item.dart';
// import 'package:movies_app/movies/movies_watchlist/watchlist_tap/WatchListViewModel.dart';
// import 'package:provider/provider.dart';

// class WatchListScreen extends StatefulWidget {
//   const WatchListScreen({super.key});

//   @override
//   State<WatchListScreen> createState() => _WatchListScreenState();
// }

// class _WatchListScreenState extends State<WatchListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WatchListViewModel>(context);
//     return ListView.separated(
//       itemCount: provider.movies.length,
//       itemBuilder: (context, index) {
//         return SearchedMovieItem(movie: provider.movies[index]);
//       },
//       separatorBuilder: (BuildContext context, int index) => Container(
//         margin: EdgeInsets.symmetric(vertical: 16.h),
//         color: Colors.grey,
//         width: double.infinity,
//         height: 2,
//       ),
//     );
//   }
// }
