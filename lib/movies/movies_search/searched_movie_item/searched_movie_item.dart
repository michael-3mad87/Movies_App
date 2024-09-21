import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import '../../../shared/loading_state.dart';
import '../../movies_details/views/screens/movie_details.dart';
import '../../movies_home/popular/data/models/movies.dart';


class SearchedMovieItem extends StatelessWidget {
  final Movies movie;
  const SearchedMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MoviesDetails.routeName,
          arguments: movie,

        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    movie.backdropPath != '' && movie.backdropPath != null
                        ? CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const LoadingState(),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.37,
                      fit: BoxFit.fill,
                    )
                        : SizedBox(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.37,
                      child: const Icon(Icons.error),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,color: AppTheme.white
                            ),
                          ),
                          movie.releaseDate != '' && movie.releaseDate != null
                              ? Text(
                            movie.releaseDate!.substring(0, 4),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppTheme.white),
                          )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
