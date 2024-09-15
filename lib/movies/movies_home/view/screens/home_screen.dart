// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_home/view/widget/icon_navbar.dart';
import 'package:movies_app/movies/movies_home/view/widget/slider_movie.dart';
import 'package:movies_app/new_releases_movies/view/widgets/releases_movie_list.dart';
import 'package:movies_app/shared/app_theme.dart';

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
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: IconNavbar('assets/icons/Home icon.png')),
          BottomNavigationBarItem(
              label: 'Search', icon: IconNavbar('assets/icons/search.png')),
          BottomNavigationBarItem(
              label: 'Browse', icon: IconNavbar('assets/icons/browse.png')),
          BottomNavigationBarItem(
              label: 'Watchlist',
              icon: IconNavbar('assets/icons/watchlist.png')),
        ],
      ),
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
