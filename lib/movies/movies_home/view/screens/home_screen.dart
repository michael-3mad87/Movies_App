import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/popular/view/widgets/slider_movie.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/view/widgets/releases_movie_list.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/view/widget/recommendedMovies_List.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(
              AssetImage('assets/icons/homeIcon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: ImageIcon(
              AssetImage('assets/icons/search.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Browse',
            icon: ImageIcon(
              AssetImage('assets/icons/browse.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'WatchList',
            icon: ImageIcon(
              AssetImage('assets/icons/watch.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SliderMovie(),
            SizedBox(
              height: 10.h,
            ),
            const ReleasesMovieList(),
            SizedBox(
              height: 10.h,
            ),
            const RecommendedMoviesList()
          ],
        ),
      ),
    );
  }
}
