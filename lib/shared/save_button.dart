import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_watchlist/watchlist_tap/Movie_Widget.dart';
import 'package:movies_app/shared/app_theme.dart';

import '../movies/movies_watchlist/watchlist_tap/FirerBase_Utils.dart';

class SavedButton extends StatefulWidget {
   SavedButton({super.key});
  MovieWidgetItem movie = MovieWidgetItem(id: '');
  @override
  State<SavedButton> createState() => _SavedButtonState();
}
class _SavedButtonState extends State<SavedButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        isClicked = !isClicked;
        setState(() {});
        if (isClicked) {
          await FirebaseUtils.addMovieToFirebase(widget.movie.id.toString());
        } else {
          await FirebaseUtils.removeMovieFromFirebase(widget.movie.id.toString());
        }
      },
      child: Stack(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(
                Icons.bookmark,
                color: isClicked
                    ? AppTheme.bookMarkColor
                    : AppTheme.darkGrey.withOpacity(.75),
                size: MediaQuery.of(context).size.width / 9,
              ),
              Icon(
                isClicked ? Icons.check : Icons.add,
                color: AppTheme.white,
                size: MediaQuery.of(context).size.width / 17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
