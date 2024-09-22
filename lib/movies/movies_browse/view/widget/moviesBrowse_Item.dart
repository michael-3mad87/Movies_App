import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';
import 'package:movies_app/shared/loading_state.dart';

import '../../../../shared/app_theme.dart';

class MoviesbrowseItem extends StatelessWidget {
  MoviesbrowseItem({super.key, required this.image, required this.category});
  final String image;
  categories category;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LoadingState(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppTheme.white,
                size: 16,
              ),
            ),
            Container(
              color: Colors.black45,
            ),
            Text(
              category.name ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
