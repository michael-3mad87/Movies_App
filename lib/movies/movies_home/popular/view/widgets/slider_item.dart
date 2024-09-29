import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/constant/functions.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/movies/movies_home/view/widgets/background_stack.dart';
import 'package:movies_app/shared/erro_Image.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/save_button.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderItem extends StatelessWidget {
  const SliderItem(this.slidableMovieModel, {super.key});
  final MoviesMain slidableMovieModel;
  @override
  Widget build(BuildContext context) {
    String year =
        ConstantsFunction.formattingDate(slidableMovieModel.releaseDate ?? '');
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              BackgroundStack(
                  image:
                      '${ApiConstant.imageUrl}${slidableMovieModel.backdropPath}'),
              Positioned(
                left: 20.w,
                bottom: -50.h,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MoviesDetails.routeName,
                          arguments: slidableMovieModel.id,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ApiConstant.imageUrl}${slidableMovieModel.posterPath}',
                          placeholder: (_, __) => const LoadingState(),
                          errorWidget: (context, url, error) => ErroImage(
                            width: 129.w,
                            height: 190.h,
                          ),
                          width: 129.w,
                          height: 190.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -8.h,
                      left: -10.w,
                      child: SavedButton(slidableMovieModel),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 80.w,
                bottom: -70.h,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(85.w, 0, 20.w, 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        slidableMovieModel.originalTitle ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            year,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(width: 14.w),
                          const Icon(
                            Icons.star_outlined,
                            size: 14,
                            color: AppTheme.gold,
                          ),
                          Text(
                            ' ${slidableMovieModel.voteAverage!.toStringAsFixed(1)}',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
