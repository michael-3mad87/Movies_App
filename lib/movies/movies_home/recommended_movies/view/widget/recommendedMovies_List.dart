import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/view/widget/recommend_movie_item.dart';
import 'package:movies_app/movies/movies_home/recommended_movies/view_model/recommended_view_model.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class RecommendedmoviesList extends StatelessWidget {
  const RecommendedmoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecommendedViewModel(),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppTheme.grey,
            height: 275.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recomended',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Consumer<RecommendedViewModel>(
                    builder: (_, viewModel, __) {
                      if (viewModel.isloading) {
                        return LoadingState();
                      } else if (viewModel.errormessage != null) {
                        return ErrorState();
                      } else {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => RecommendMovieItem(
                                viewModel.recommend_movies[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 8,
                                ),
                            itemCount: viewModel.recommendMovies.length);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
