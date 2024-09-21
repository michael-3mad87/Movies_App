import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/data/data_source/newRlease_data_source.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/view/widgets/releases_movie_item.dart';
import 'package:movies_app/movies/movies_home/newRealse_movies/view_model/newRlease_viewModel.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class ReleasesMovieList extends StatelessWidget {
  const ReleasesMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          color: AppTheme.grey,
          height: 190.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New Releases',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ChangeNotifierProvider(
                  create: (_) => NewrleaseMoviesViewmodel(),
                  child: Consumer<NewrleaseMoviesViewmodel>(
                    builder: (context, Viewmodel, __) {
                      if (Viewmodel.isLoading) {
                        return LoadingState();
                      } else if (Viewmodel.errorMessage != null) {
                        return ErrorState();
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) =>
                              ReleasesMovieItem(Viewmodel.realsesMovies[index]),
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: Viewmodel.realsesMovies.length,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
