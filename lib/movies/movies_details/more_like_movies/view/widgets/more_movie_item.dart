import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/poster_widget.dart';

class MoreLikeMovieItem extends StatelessWidget {
  const MoreLikeMovieItem(this.movies, {super.key});

  final MoviesMain movies;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          MoviesDetails.routeName,
          arguments: movies.id,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosterWidget(
            image: '${ApiConstant.imageUrl}${movies.posterPath}',
            height: 140,
            movie: movies,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.movieListColor,
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.all(4),
            width: 110.w,
            height: 65.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_outlined,
                      size: 16.h,
                      color: AppTheme.gold,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      movies.voteAverage!.toStringAsFixed(1),
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  movies.originalTitle ?? '',
                  style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  ConstantsFunction.formattingDate(movies.releaseDate ?? ''),
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
