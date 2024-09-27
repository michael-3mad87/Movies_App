import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_browse/data/models/movies_browse.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/poster_widget.dart';

class MoviesBrowseItem extends StatelessWidget {
  const MoviesBrowseItem(this.browseMovies, {super.key});
  final BrowseMovies browseMovies;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MoviesDetails.routeName,
          arguments: browseMovies.id,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PosterWidget(
            image: '${ApiConstant.imageUrl}${browseMovies.posterPath}',
            height: 180,
            width: 165,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppTheme.movieListColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  )),
              width: 165.w,
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    browseMovies.originalTitle ?? '',
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 13.sp,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_outlined,
                        size: 12,
                        color: AppTheme.gold,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '${browseMovies.voteAverage!.toStringAsFixed(1)}',
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
