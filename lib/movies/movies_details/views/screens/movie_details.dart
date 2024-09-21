import 'package:flutter/material.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_details/view_model/movie_details_view_model.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/view/widgets/moreMovies_List.dart';
import 'package:movies_app/movies/movies_home/view/widgets/background_stack.dart';
import 'package:movies_app/movies/movies_details/views/widget/container_genre.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/poster_widget.dart';
import 'package:provider/provider.dart';

class MoviesDetails extends StatefulWidget {
  const MoviesDetails({super.key});
  static const String routeName = 'MovieDetails';

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    final movieId = ModalRoute.of(context)?.settings.arguments as int;

    return ChangeNotifierProvider(
      create: (_) => MovieDetailsViewModel()..getMoviesDetails(movieId),
      child: Consumer<MovieDetailsViewModel>(builder: (_, viewModel, __) {
        if (viewModel.isLoading) {
          return const LoadingState();
        } else if (viewModel.errorMessage != null) {
          return const ErrorState();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                viewModel.movieDetailsResponse?.title ?? '',
                style: theme.titleMedium,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundStack(
                  image:
                      '${ApiConstant.imageUrl}${viewModel.movieDetailsResponse?.backdropPath}',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.w, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.movieDetailsResponse?.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 18.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            viewModel.movieDetailsResponse?.releaseDate ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppTheme.textGenreColor,
                                    fontSize: 12.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 14),
                          const Icon(
                            Icons.star_outlined,
                            size: 15,
                            color: AppTheme.gold,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "${viewModel.movieDetailsResponse?.voteAverage!.toStringAsFixed(1)}" ??
                                "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppTheme.textGenreColor,
                                    fontSize: 12.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PosterWidget(
                            image:
                                '${ApiConstant.imageUrl}${viewModel.movieDetailsResponse?.posterPath}',
                            height: 199,
                            width: 129,
                          ),
                          SizedBox(width: 11.w),
                          SizedBox(
                            width: 250.w,
                            height: 170,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 9.w,
                                      mainAxisSpacing: 5.h,
                                      childAspectRatio: 3,
                                    ),
                                    itemCount: viewModel.movieDetailsResponse
                                            ?.genres?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return ContainerGenreWidget(
                                        genreName: viewModel
                                                .movieDetailsResponse
                                                ?.genres?[index]
                                                .name ??
                                            "",
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    viewModel.movieDetailsResponse?.overview ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: AppTheme.textGenreColor,
                                          height: 1.5,
                                          fontSize: 15.sp,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: 230,
                    child: MoremoviesList(movieId ?? 0),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
























// import 'package:flutter/material.dart';
// import 'package:movies_app/constant/api_constant.dart';
// import 'package:movies_app/movies/movies_details/view_model/movie_details_view_model.dart';
// import 'package:movies_app/movies/movies_home/moreLike_movies/view/widgets/moreMovies_List.dart';
// import 'package:movies_app/movies/movies_home/view/widgets/background_stack.dart';
// import 'package:movies_app/movies/movies_details/views/widget/container_genre.dart';
// import 'package:movies_app/shared/app_theme.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/shared/error_state.dart';
// import 'package:movies_app/shared/loading_state.dart';
// import 'package:movies_app/shared/poster_widget.dart';
// import 'package:provider/provider.dart';

// class MoviesDetails extends StatefulWidget {
//   const MoviesDetails({super.key});
//   static const String routeName = 'MovieDetails';

//   @override
//   State<MoviesDetails> createState() => _MoviesDetailsState();
// }

// class _MoviesDetailsState extends State<MoviesDetails> {
//   @override
//   Widget build(BuildContext context) {
//     final TextTheme theme = Theme.of(context).textTheme;
//     final movieId = ModalRoute.of(context)?.settings.arguments as int;

//     return ChangeNotifierProvider(
//       create: (_) => MovieDetailsViewModel()..getMoviesDetails(movieId),
//       child: Consumer<MovieDetailsViewModel>(builder: (_, viewModel, __) {
//         if (viewModel.isLoading) {
//           return const LoadingState();
//         } else if (viewModel.errorMessage != null) {
//           return const ErrorState();
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 viewModel.movieDetailsResponse?.title ?? '',
//                 style: theme.titleMedium,
//               ),
//             ),
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BackgroundStack(
//                     image:
//                         '${ApiConstant.imageUrl}${viewModel.movieDetailsResponse?.backdropPath}'),
//                 Padding(
//                   padding: EdgeInsets.only(left: 18.w, top: 8.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         viewModel.movieDetailsResponse?.title ?? "",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium
//                             ?.copyWith(fontSize: 18.sp),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 3.h),
//                       Text(
//                         viewModel.movieDetailsResponse?.releaseDate ?? "",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium
//                             ?.copyWith(
//                                 color: AppTheme.textGenreColor,
//                                 fontSize: 12.sp),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       SizedBox(height: 4.h),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           PosterWidget(
//                             image:
//                                 '${ApiConstant.imageUrl}${viewModel.movieDetailsResponse?.posterPath}',
//                             height: 199,
//                             width: 129,
//                           ),
//                           SizedBox(width: 11.w),
//                           Expanded(
//                             child: SizedBox(
//                               width: 250.w,
//                               height: 200.h,
//                               child: Column(
//                                 children: [
//                                   Expanded(
//                                     child: GridView.builder(
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 3,
//                                         crossAxisSpacing: 9.w,
//                                         mainAxisSpacing: 7.h,
//                                         childAspectRatio: 3,
//                                       ),
//                                       itemCount: viewModel.movieDetailsResponse
//                                               ?.genres?.length ??
//                                           0,
//                                       itemBuilder: (context, index) {
//                                         return ContainerGenreWidget(
//                                           genreName: viewModel
//                                                   .movieDetailsResponse
//                                                   ?.genres?[index]
//                                                   .name ??
//                                               "",
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 170.h,
//                                     child: SingleChildScrollView(
//                                       child: Text(
//                                         viewModel.movieDetailsResponse
//                                                 ?.overview ??
//                                             "",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleMedium
//                                             ?.copyWith(
//                                                 color: AppTheme.textGenreColor,
//                                                 height: 1.5,
//                                                 fontSize: 13.sp),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 40.0),
//                                     child: MoremoviesList(movieId ?? 0),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
