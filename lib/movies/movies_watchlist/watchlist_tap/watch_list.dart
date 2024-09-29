import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_watchlist/watchlist_tap/WatchListViewModel.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/movies/movies_watchlist/watchlist_tap/Movie_Widget.dart';
import 'package:movies_app/shared/app_theme.dart';

class WatchListScreen extends StatelessWidget {
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
          ChangeNotifierProvider(
            create: (context) => WatchListViewModel(),
            child: Consumer<WatchListViewModel>(
              builder: (context, watchListViewModel, child) {
                final movieList = watchListViewModel.movies;

                if (movieList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return MovieWidgetItem(movieList[index]);
                    },
                    itemCount: movieList.length,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Divider(
                          color: AppTheme.darkGrey,
                          thickness: 1,
                          height: 1,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
