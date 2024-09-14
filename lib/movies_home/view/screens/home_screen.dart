import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies_home/view/widget/movie_Item.dart';
import 'package:movies_app/movies_home/view/widget/save_button.dart';
import 'package:movies_app/movies_home/view/widget/slider_movie.dart';
import 'package:movies_app/new_releases_movies/view/widgets/releases_movie_item.dart';
import 'package:movies_app/new_releases_movies/view/widgets/releases_movie_list.dart';
import 'package:movies_app/shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            SliderMovie(),
            ReleasesMovieList(),
          ],
        ),
      ),
    );
  }
}
