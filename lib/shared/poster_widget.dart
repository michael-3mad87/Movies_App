import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/erro_Image.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:movies_app/shared/moviesMain.dart';
import 'package:movies_app/shared/save_button.dart';

class PosterWidget extends StatelessWidget {
  PosterWidget(
      {this.height = 170,
      super.key,
      this.width = 110,
      required this.image,
      required this.movie});

  final String image;
  final double height;
  final double width;
  MoviesMain movie;
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
            errorWidget: (context, url, error) => ErroImage(
              height: height,
              width: width,
            ),
          ),
        ),
        Positioned(
          top: -8.h,
          left: -10.w,
          child: SavedButton(movie),
        ),
      ],
    );
  }
}
