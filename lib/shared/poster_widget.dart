import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: Image.asset(
            image,
            width: 110.w,
            height: 172.h,
            fit: BoxFit.cover,
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
