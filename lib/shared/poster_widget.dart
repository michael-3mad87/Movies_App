import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/save_button.dart';

class PosterWidget extends StatelessWidget {
  PosterWidget(this.image, {super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CachedNetworkImage(
            imageUrl: image,
            width: 100.w,
            height: 160.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => LoadingState(),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: AppTheme.white,
              size: 16,
            ),
          ),
        ),
        Positioned(
          top: -8.h,
          left: -10.w,
          child: const SavedButton(),
        ),
      ],
    );
  }
}
