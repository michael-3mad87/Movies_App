import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/view/widgets/releases_movie_item.dart';
import 'package:movies_app/movies/movies_home/new_releases%20_movies/view_model/new_releases_view_model.dart';
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
          padding: const EdgeInsets.all(8.0),
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
                  create: (_) => NewReleasesViewModel(),
                  child: Consumer<NewReleasesViewModel>(
                    builder: (context, viewModel, __) {
                      if (viewModel.isLoading) {
                        return const LoadingState();
                      } else if (viewModel.errorMessage != null) {
                        return const ErrorState();
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => ReleasesMovieItem(
                              viewModel.releasesMovies[index]),
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: viewModel.releasesMovies.length,
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
