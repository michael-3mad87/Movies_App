import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_browse/view/screens/movies_browse_screen.dart';
import 'package:movies_app/movies/movies_home/view/screens/home_screen.dart';
import 'package:movies_app/movies/movies_details/movie_details/views/screens/movie_details.dart';
import 'package:movies_app/shared/app_theme.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.routeName: (_) => const HomeScreen(),
              MoviesDetails.routeName: (_) => const MoviesDetails(),
              MoviesBrowseScreen.routeName: (_) => const MoviesBrowseScreen(),
            },
            initialRoute: HomeScreen.routeName,
            themeMode: ThemeMode.dark,
            darkTheme: AppTheme.darkTheme,
          );
        });
  }
}
