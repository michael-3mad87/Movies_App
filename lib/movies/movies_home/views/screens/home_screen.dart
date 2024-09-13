import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/views/widget/movie_poster.dart';
import 'package:movies_app/shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> movieList = [
    {
      'title': 'Dora and the lost city of gold',
      'year': '2019',
      'rating': 'PG-13',
      'duration': '2h 7m',
      'poster': 'assets/images/homescreen.png', // Use your actual image path
      'background':
          'assets/images/homescreen.png', // Use your actual background path
    },
    {
      'title': 'Spider-Man: No Way Home',
      'year': '2021',
      'rating': 'PG-13',
      'duration': '2h 28m',
      'poster': 'assets/images/homescreen.png', // Example 2nd movie
      'background': 'assets/images/homescreen.png',
    },
    // Add more movies if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary, 
      body: SafeArea(
        child: CarouselSlider.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index, realIdx) {
            final movie = movieList[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                        child: Image.asset(
                          movie['background']!,
                          width: MediaQuery.of(context).size.width,
                          height: 217.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: AppTheme.primary,
                              size: 45.sp,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.w,
                        bottom: -50.h,
                        child: MoviePoster()
                      ),
                      Expanded(
                        child: Positioned(
                          left: 80.w,
                          bottom: -70.h,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(85.w, 0, 20.w, 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Text(
                                      movie['year']!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.sp),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      movie['rating']!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.sp),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      movie['duration']!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 412.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval:const Duration(seconds: 3),
            autoPlayAnimationDuration:const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
