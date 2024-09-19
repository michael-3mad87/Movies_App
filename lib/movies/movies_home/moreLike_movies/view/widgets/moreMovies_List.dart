import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/view/widgets/moreMovie_item.dart';
import 'package:movies_app/movies/movies_home/moreLike_movies/view_model/MoreLike_view_model.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class MoremoviesList extends StatelessWidget {
  MoremoviesList(this.movieId, {super.key});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MorelikeViewModel(movieId),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: AppTheme.grey,
            height: 268.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'More Like This',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Consumer<MorelikeViewModel>(
                    builder: (_, viewModel, __) {
                      if (viewModel.isLoading) {
                        return const LoadingState();
                      } else if (viewModel.errorMessage != null) {
                        return const ErrorState();
                      } else {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                MoremovieItem(viewModel.moreMovies[index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 8,
                                ),
                            itemCount: 5);
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
