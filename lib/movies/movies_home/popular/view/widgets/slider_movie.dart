import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/popular/model_view/popular_model_view.dart';
import 'package:movies_app/movies/movies_home/popular/view/widgets/slider_item.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class SliderMovie extends StatefulWidget {
  const SliderMovie({super.key});

  @override
  State<SliderMovie> createState() => _SliderMovieState();
}

class _SliderMovieState extends State<SliderMovie> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PopularModelView(),
      child: Consumer<PopularModelView>(
        builder: (_, popularViewModel, __) {
          if (popularViewModel.isLoading) {
            return const LoadingState();
          } else if (popularViewModel.errorMessage != null) {
            return const ErrorState();
          } else if (popularViewModel.popularMovies.isEmpty) {
            return const Center(
                child: Text('No movies available',
                    style: TextStyle(color: Colors.white)));
          } else {
            return CarouselSlider.builder(
              itemCount: popularViewModel.popularMovies.length,
              itemBuilder: (context, index, realIdx) {
                return SliderItem(popularViewModel.popularMovies[index]);
              },
              options: CarouselOptions(
                height: 275.h,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                autoPlay: true,
                disableCenter: true,
                aspectRatio: 16 / 9,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
              ),
            );
          }
        },
      ),
    );
  }
}
