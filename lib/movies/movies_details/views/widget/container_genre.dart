import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/shared/app_theme.dart';

class ContainerGenreWidget extends StatelessWidget {
  const ContainerGenreWidget({
    super.key,
    required this.genreName,
  });
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 25.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppTheme.borderColor,
          width: 1.w,
        ),
      ),
      child: Text(
        genreName,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: AppTheme.textGenreColor, fontSize: 10),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
