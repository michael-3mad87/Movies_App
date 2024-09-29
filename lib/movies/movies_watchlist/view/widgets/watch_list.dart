import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_watchlist/view_model/WatchListViewModel.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/movies/movies_watchlist/view/widgets/Movie_Widget.dart';
import 'package:movies_app/shared/app_theme.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watchlist',
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChangeNotifierProvider(
                    create: (context) => WatchListViewModel()..fetchMovies(),
                    child: Consumer<WatchListViewModel>(
                      builder: (context, watchListViewModel, child) {
                        List<MoviesMain> movieList = watchListViewModel.movies;
                        if (watchListViewModel.isloading) {
                          return const LoadingState();
                        } else if (watchListViewModel.errorMessage != null) {
                          return const ErrorState();
                        } else if (movieList.isEmpty) {
                          return Text('watch List is empty ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 24,
                                    color: AppTheme.borderColor,
                                  ));
                        } else {
                          return Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return MovieWidgetItem(movieList[index]);
                              },
                              itemCount: movieList.length,
                              separatorBuilder: (context, index) {
                                return const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Divider(
                                    color: AppTheme.darkGrey,
                                    thickness: 1,
                                    height: 1,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
