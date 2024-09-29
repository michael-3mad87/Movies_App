import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_search/view/search_movies_list.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:provider/provider.dart';

import '../view_model/search_tab_view_model.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchTabViewModel(),
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: TextFormField(
                cursorColor: AppTheme.white,
                style: const TextStyle(color: AppTheme.white),
                onChanged: (value) async {
                  Provider.of<SearchTabViewModel>(context, listen: false)
                      .changeMovies(value);
                },
                decoration: InputDecoration(
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(color: AppTheme.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(color: AppTheme.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: const BorderSide(color: AppTheme.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppTheme.white,
                  ),
                  filled: true,
                  fillColor: AppTheme.searchAppColor,
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppTheme.white.withOpacity(.5),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(child: SearchedMovieList()),
          ],
        ),
      ),
    );
  }
}
