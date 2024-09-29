import 'package:flutter/material.dart';
import 'package:movies_app/movies/movies_Categories/data/model/categories.dart';
import 'package:movies_app/movies/movies_browse/view/widgets/movies_browse_item.dart';
import 'package:movies_app/movies/movies_browse/view_model/movies_browse_view_model.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class MoviesBrowseScreen extends StatelessWidget {
  const MoviesBrowseScreen({super.key});
  static const String routeName = 'MoviesBrowseScreen';
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as categories;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${category.name} Movies',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ChangeNotifierProvider(
          create: (_) => MoviesBrowseViewModel(category.id ?? 0),
          child: Consumer<MoviesBrowseViewModel>(
            builder: (context, viewModel, _) {
              if (viewModel.isLoading) {
                return const LoadingState();
              } else if (viewModel.errorMessage != null) {
                return const ErrorState();
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 24,
                  ),
                  itemBuilder: (context, index) =>
                      MoviesBrowseItem(viewModel.browseMovies[index]),
                  itemCount: viewModel.browseMovies.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
