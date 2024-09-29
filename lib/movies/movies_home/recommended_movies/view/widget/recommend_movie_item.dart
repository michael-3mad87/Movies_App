import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/poster_widget.dart';

class RecommendMovieItem extends StatelessWidget {
  const RecommendMovieItem(this.recommendMovie, {super.key});
  final MoviesMain recommendMovie;

  @override
  Widget build(BuildContext context) {
    String year =
        ConstantsFunction.formattingDate(recommendMovie.releaseDate ?? '');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MoviesDetails.routeName,
          arguments: recommendMovie.id,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterWidget(
            image: '${ApiConstant.imageUrl}${recommendMovie.posterPath}',
            height: 140,
            movie: recommendMovie,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.movieListColor,
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.all(4),
            width: 110.w,
            height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_outlined,
                      size: 14,
                      color: AppTheme.gold,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      recommendMovie.voteAverage!.toStringAsFixed(1),
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  recommendMovie.originalTitle ?? '',
                  style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  ConstantsFunction.formattingDate(
                      recommendMovie.releaseDate ?? ''),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
