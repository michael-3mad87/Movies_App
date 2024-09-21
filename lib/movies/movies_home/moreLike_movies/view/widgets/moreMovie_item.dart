import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_details/views/screens/movie_details.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/data/model/moreLikeMovies.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/poster_widget.dart';

class MoremovieItem extends StatelessWidget {
  MoremovieItem(this.movies, {super.key});

  moreLikeMovies movies;
  @override
  Widget build(BuildContext context) {
    String year = ConstantsFunction.formattingDate(movies.releaseDate ?? '');
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
                      size: 14,
                      color: AppTheme.gold,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${movies.voteAverage!.toStringAsFixed(1)}',
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
                  movies.originalTitle ?? '',
                  style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 12.sp,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 1,
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
