import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies_home/view/widget/save_button.dart';

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
        const SavedButton(),
      ],
    );
  }
}
