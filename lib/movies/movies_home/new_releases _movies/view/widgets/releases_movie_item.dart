import 'package:flutter/material.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/data/models/new_releases_movies.dart';
import 'package:movies_app/shared/poster_widget.dart';

class ReleasesMovieItem extends StatelessWidget {
 const ReleasesMovieItem(this.movie, {super.key});
 final NewReleasesMovie movie;
  @override
  Widget build(BuildContext context) {
    return PosterWidget('${ApiConstant.imageUrl}${movie.posterPath}');
  }
}
