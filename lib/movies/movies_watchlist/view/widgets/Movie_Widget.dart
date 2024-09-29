import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/poster_widget.dart';

class MovieWidgetItem extends StatelessWidget {
  final MoviesMain movie;

  const MovieWidgetItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MoviesDetails.routeName,
          arguments: movie.id,
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PosterWidget(
                image: '${ApiConstant.imageUrl}${movie.backdropPath}',
                movie: movie,
                height: 90,
                width: 140,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            color: AppTheme.white,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ConstantsFunction.formattingDate(movie.releaseDate ?? ''),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppTheme.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.overview ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.textGenreColor,
                            height: 1.5,
                            fontSize: 15.sp,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
