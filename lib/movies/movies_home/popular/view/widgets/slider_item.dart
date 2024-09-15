import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constant/api_constant.dart';
import 'package:movies_app/movies/movies_home/popular/data/models/movies.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/save_button.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderItem extends StatelessWidget {
  const SliderItem(this.slidableMovieModel, {super.key});
  final Movies slidableMovieModel;
  @override
  Widget build(BuildContext context) {
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
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child:CachedNetworkImage(
                  imageUrl: '${ApiConstant.imageUrl}${slidableMovieModel.posterPath}',
                   placeholder: (_, __) =>const LoadingState(),
                  width: MediaQuery.of(context).size.width,
                  height: 217.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration:const BoxDecoration(
                      color: AppTheme.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: AppTheme.primary,
                      size: 45.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20.w,
                bottom: -50.h,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiConstant.imageUrl}${slidableMovieModel.posterPath}',
                        placeholder: (_, __) =>const LoadingState(),
                        width: 129.w,
                        height: 199.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: -8.h,
                      left: -10.w,
                      child: const SavedButton(),
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
                            slidableMovieModel.releaseDate ?? '',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '',
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
