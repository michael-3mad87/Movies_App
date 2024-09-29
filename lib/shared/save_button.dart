import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/movies/movies_watchlist/data/data_source/FirerBase_Utils.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/movies/movies_watchlist/view_model/WatchListViewModel.dart';

class SavedButton extends StatefulWidget {
  final MoviesMain movie;

  const SavedButton(this.movie, {super.key});

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
        } else {
          await FirebaseUtils.updateMovieWatchListStatus(
              widget.movie.id!, widget.movie.isWatchList);
          Provider.of<WatchListViewModel>(context, listen: false)
              .removeMovieFromWatchList(widget.movie.id!);
        }
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
