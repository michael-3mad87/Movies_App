import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_browse/data/model/categories.dart';
import 'package:movies_app/movies/movies_browse/view/widget/moviesBrowse_Item.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/loading_state.dart';

class MoviesBrowse extends StatelessWidget {
  MoviesBrowse({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.white,
                  fontSize: 22.sp,
                ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                childAspectRatio: 1.7,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (context, index) => MoviesbrowseItem(category:  , image: '',),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
