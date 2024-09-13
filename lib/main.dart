import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_details/views/screen/movie_details.dart';
import 'package:movies_app/movies/movies_home/views/screens/home_screen.dart';
import 'package:movies_app/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(_)=>const HomeScreen(),
        MoviesDetails.routeName:(_)=>const MoviesDetails()
      },
      themeMode:ThemeMode.dark ,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
