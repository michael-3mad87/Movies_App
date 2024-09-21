import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: AppTheme.white),
              onChanged: (value) async {
                Provider.of<SearchTabViewModel>(context, listen: false)
                    .changeMovies(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide(color: AppTheme.white),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.white,
                ),
                filled: true,
                fillColor: AppTheme.grey,
                hintText: 'Search',
              ),
            ),
            const Expanded(child: SearchedMovieList()),
          ],
        ),
      ),
    );
  }
}
