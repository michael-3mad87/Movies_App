import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_watchlist/watchlist_tap/WatchListViewModel.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:provider/provider.dart';
import '../movies/movies_watchlist/watchlist_tap/FirerBase_Utils.dart';

class SavedButton extends StatefulWidget {
  final MoviesMain movie;

  SavedButton(this.movie, {super.key});

  @override
  State<SavedButton> createState() => _SavedButtonState();
}

class _SavedButtonState extends State<SavedButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        widget.movie.isWatchList = !widget.movie.isWatchList;

        if (widget.movie.isWatchList) {
          await FirebaseUtils.addMovieToWatchList(widget.movie);
          Provider.of<WatchListViewModel>(context).iswatchlist;
        } else {
          await FirebaseUtils.deleteMovieFromWatchList(widget.movie.id!);
        }
        await FirebaseUtils.getWatchListMovies();
        setState(() {});
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Icon(
            Icons.bookmark,
            color: widget.movie.isWatchList
                ? AppTheme.bookMarkColor
                : AppTheme.darkGrey.withOpacity(.75),
            size: MediaQuery.of(context).size.width / 9,
          ),
          Icon(
            widget.movie.isWatchList ? Icons.check : Icons.add,
            color: AppTheme.white,
            size: MediaQuery.of(context).size.width / 17,
          ),
        ],
      ),
    );
  }
}
