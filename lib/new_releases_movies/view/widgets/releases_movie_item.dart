import 'package:flutter/material.dart';
import 'package:movies_app/shared/poster_widget.dart';

class ReleasesMovieItem extends StatelessWidget {
  const ReleasesMovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: PosterWidget('assets/images/poster_image.png'),
    );
  }
}
