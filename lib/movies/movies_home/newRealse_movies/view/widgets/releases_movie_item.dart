import 'package:flutter/material.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/data/models/newRealse_movies.dart';
import 'package:movies_app/shared/poster_widget.dart';

class ReleasesMovieItem extends StatelessWidget {
  ReleasesMovieItem(this.movie, {super.key});
  newRealse_movie movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: PosterWidget('${ApiConstant.imageUrl}${movie.posterPath}'),
    );
  }
}
