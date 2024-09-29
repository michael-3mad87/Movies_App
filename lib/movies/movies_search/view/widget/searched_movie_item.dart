import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/erro_Image.dart';
import 'package:movies_app/shared/moviesMain.dart';
import '../../../../shared/loading_state.dart';
import '../../../movies_details/movie_details/views/screens/movie_details.dart';

class SearchedMovieItem extends StatelessWidget {
  final MoviesMain movie;
  const SearchedMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MoviesDetails.routeName,
          arguments: movie.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: '${ApiConstant.imageUrl}${movie.backdropPath}',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const LoadingState(),
                  errorWidget: (context, url, error) => ErroImage(
                    height: 90.h,
                    width: 140.w,
                  ),
                  height: 90.h,
                  width: 140.w,
                  fit: BoxFit.cover,
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
                        ConstantsFunction.formattingDate(
                            movie.releaseDate ?? ''),
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
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
      ),
    );
  }
}
