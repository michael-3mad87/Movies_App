import 'package:flutter/material.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/poster_widget.dart';

class ReleasesMovieItem extends StatelessWidget {
  const ReleasesMovieItem(this.newReleasesMovie, {super.key});
  final MoviesMain newReleasesMovie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MoviesDetails.routeName,
          arguments: newReleasesMovie.id,
        );
      },
      child: PosterWidget(
        width: 100,
        image: '${ApiConstant.imageUrl}${newReleasesMovie.posterPath}',
        movie: newReleasesMovie,
      ),
    );
  }
}
