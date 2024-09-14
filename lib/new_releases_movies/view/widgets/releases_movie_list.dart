import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/new_releases_movies/view/widgets/releases_movie_item.dart';
import 'package:movies_app/shared/app_theme.dart';

class ReleasesMovieList extends StatelessWidget {
  const ReleasesMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          color: AppTheme.grey,
          height: 250.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Releases',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => ReleasesMovieItem(),
                  separatorBuilder: (_, index) => SizedBox(
                    width: 8,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
