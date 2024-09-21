import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/save_button.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget(
      {this.height = 170, super.key, this.width = 110, required this.image});

  final String image;
  final int height;
  final int width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CachedNetworkImage(
            imageUrl: image,
            width: width.w,
            height: height.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LoadingState(),
            errorWidget: (context, url, error) => const Icon(
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
