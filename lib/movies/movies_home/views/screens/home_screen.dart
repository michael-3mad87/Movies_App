import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: CarouselSlider.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index, realIdx) {
          final movie = movieList[index];
          return Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    movie['background']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 217.h,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    right: 20,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              movie['poster']!,
                              width: 129.h,
                              height: 199.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    movie['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        movie['year']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        movie['rating']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        movie['duration']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        options: CarouselOptions(
          height: 320.h,
          autoPlay: false,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
