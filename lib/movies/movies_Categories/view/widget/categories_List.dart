import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_Categories/view/widget/category_Item.dart';
import 'package:movies_app/movies/movies_Categories/view_model/categories_viewModel.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/error_state.dart';
import 'package:movies_app/shared/loading_state.dart';
import 'package:provider/provider.dart';

class Categories_List extends StatelessWidget {
  const Categories_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppTheme.white,
                  fontSize: 22.sp,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (_) => CategoriesViewmodel(),
              child: Consumer<CategoriesViewmodel>(
                builder: (context, viewModel, _) {
                  if (viewModel.isLoading) {
                    return const LoadingState();
                  } else if (viewModel.errorMessage != null) {
                    return const ErrorState();
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        childAspectRatio: 1.7,
                        crossAxisSpacing: 14,
                      ),
                      itemBuilder: (context, index) => Category_Item(
                        category: viewModel.categoires[index],
                      ),
                      itemCount: viewModel.categoires.length,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
