import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_Categories/view/widget/categories_List.dart';
import 'package:movies_app/movies/movies_home/popular/view/widgets/slider_movie.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/view/widgets/releases_movie_list.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/view/widget/recommended_movies_List.dart';
import 'package:movies_app/movies/movies_watchlist/view/widgets/watch_list.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../movies_search/view/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const HomeContent(),
    const SearchTab(),
    const Categories_List(),
    const WatchListScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
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
        child: screens[index],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SliderMovie(),
        SizedBox(
          height: 10.h,
        ),
        const ReleasesMovieList(),
        SizedBox(
          height: 18.h,
        ),
        const RecommendedMoviesList(),
      ],
    );
  }
}
