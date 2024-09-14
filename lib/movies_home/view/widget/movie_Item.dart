import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies_home/model/slidableMovie_model.dart';
import 'package:movies_app/movies_home/view/widget/save_button.dart';
import 'package:movies_app/shared/app_theme.dart';

class MovieItem extends StatelessWidget {
  MovieItem(this.slidablemovieModel, {super.key});
  SlidablemovieModel slidablemovieModel;
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
                child: Image.asset(
                  slidablemovieModel.banarImage,
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
                    decoration: BoxDecoration(
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
                      child: Image.asset(
                        slidablemovieModel.poster,
                        width: 129.w,
                        height: 199.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SavedButton(),
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
                        slidablemovieModel.moviename,
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
                            slidablemovieModel.year,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            slidablemovieModel.rate,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            slidablemovieModel.duration,
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
