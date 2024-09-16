import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/data/model/recommended_movies.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/poster_widget.dart';

class RecommendMovieItem extends StatelessWidget {
  const RecommendMovieItem(this.recommendMovie, {super.key});
  final RecommendedMovies recommendMovie;

  @override
  Widget build(BuildContext context) {
    String year =
        ConstantsFunction.formattingDate(recommendMovie.releaseDate ?? '');
    return Column(
      children: [
        PosterWidget(
          '${ApiConstant.imageUrl}${recommendMovie.posterPath}',
          height: 145,
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
                    width: 4,
                  ),
                  Text(
                    '${recommendMovie.voteAverage}',
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
                height: 3,
              ),
              Text(
                year,
                style: TextStyle(color: Colors.grey, fontSize: 9.sp , ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
