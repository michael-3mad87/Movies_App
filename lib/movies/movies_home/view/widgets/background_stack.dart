import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/erro_Image.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (_, __) => const LoadingState(),
            errorWidget: (context, url, error) => ErroImage(
              width: MediaQuery.of(context).size.width,
              height: 217.h,
            ),
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
              decoration: const BoxDecoration(
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
      ],
    );
  }
}
