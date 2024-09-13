import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies_home/model/slidableMovie_model.dart';
import 'package:movies_app/movies_home/view/widget/movie_Item.dart';

class SliderMovie extends StatelessWidget {
  SliderMovie({super.key});
  final List<SlidablemovieModel> movies = [
    SlidablemovieModel(
      banarImage: 'assets/images/homescreen.png',
      poster: 'assets/images/poster_image.png',
      moviename: 'Dora and the lost city of gold',
      year: '2019',
      rate: 'PG-13',
      duration: '2h 7m',
    ),
    SlidablemovieModel(
      banarImage: 'assets/images/homescreen.png',
      poster: 'assets/images/poster_image.png',
      moviename: 'Dora and the lost city of gold',
      year: '2019',
      rate: 'PG-13',
      duration: '2h 7m',
    ),
    SlidablemovieModel(
      banarImage: 'assets/images/homescreen.png',
      poster: 'assets/images/poster_image.png',
      moviename: 'Dora and the lost city of gold',
      year: '2019',
      rate: 'PG-13',
      duration: '2h 7m',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIdx) {
        return MovieItem(movies[index]);
      },
      options: CarouselOptions(
        height: 330.h,
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        disableCenter: true,
        aspectRatio: 16 / 9,
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
