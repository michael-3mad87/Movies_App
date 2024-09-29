import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/movies/movies_Categories/data/model/categories.dart';
import 'package:movies_app/movies/movies_browse/view/screens/movies_browse_screen.dart';
import 'package:movies_app/shared/app_theme.dart';
import 'package:movies_app/shared/erro_Image.dart';
import 'package:movies_app/shared/loading_state.dart';

class Category_Item extends StatelessWidget {
  Category_Item({super.key, required this.category});
  final categories category;
  Map<String, String> categoryImages = {
    "Action":
        "https://sm.ign.com/t/ign_mear/screenshot/default/john-wick-2_2gza.1280.jpg",
    "Adventure":
        "https://www.europeanstudios.com/wp-content/uploads/2024/02/adventure-film-genre-1-1024x585.jpg",
    "Animation":
        "https://is1-ssl.mzstatic.com/image/thumb/N9LQPB6unkaN9GCY9CUMZw/1200x675mf.jpg",
    "Comedy":
        "https://c4.wallpaperflare.com/wallpaper/511/419/618/minions-comedy-movie-wallpaper-preview.jpg",
    "Crime":
        "https://cdn.britannica.com/49/251849-050-54AE4F9E/bryan-cranston-aaron-paul-breaking-bad.jpg",
    "Documentary":
        "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/5BD0/production/_109140532_elmamar.jpg.webp",
    "Drama":
        "https://snworksceo.imgix.net/emu/929eecfe-eb4e-4bac-8d75-233635a87692.sized-1000x1000.jpg?w=1000&dpr=2&ar=4%3A3&fit=crop&crop=faces%2Cedges",
    "Family":
        "https://www.beaversbendcreativeescape.com/wp-content/uploads/2024/01/Hochatown-Things-to-Do.jpg",
    "Fantasy":
        "https://c4.wallpaperflare.com/wallpaper/275/717/310/avengers-infinity-war-superheroes-cast-4k-8k-wallpaper-preview.jpg",
    "History": "https://media.almashhad.com/twitter/1684225986499_zyPmb.webp",
    "Horror":
        "https://cdn.al-ain.com/lg/images/2019/9/08/78-132712-it-chapter-chemistry-horror-film_700x400.png",
    "Music":
        "https://marayana.com/wp-content/uploads/2020/11/IMG_20201114_142341.jpg",
    "Mystery":
        "https://www.comingsoon.net/wp-content/uploads/sites/3/2024/05/missing-2023.jpg",
    "Romance":
        "https://variety.com/wp-content/uploads/2021/02/To-All-the-Boys-Always-and-Forever-1.jpg?w=1000&h=563&crop=1&resize=910%2C511",
    "Science Fiction":
        "https://edgroom-blogs.s3.ap-south-1.amazonaws.com/202310071805064792540_38983_u23h.jpg",
    "TV Movie": "https://www.shofha.tv/uploads/thumbs/153dd5eed-1.jpg",
    "Thriller":
        "https://c4.wallpaperflare.com/wallpaper/483/778/342/5bd23696c3a93-wallpaper-preview.jpg",
    "War": "https://images2.alphacoders.com/616/thumb-1920-616358.jpg",
    "Western":
        "https://www.hollywoodreporter.com/wp-content/uploads/2022/12/MMDBUAN_EC002-H-2022.jpg?w=1296",
  };
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.r),
        onTap: () {
          Navigator.of(context)
              .pushNamed(MoviesBrowseScreen.routeName, arguments: category);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: categoryImages[category.name] ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              placeholder: (context, url) => const LoadingState(),
              errorWidget: (context, url, error) => ErroImage(
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              color: Colors.black38,
            ),
            Text(
              category.name ?? '',
              style:Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppTheme.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold
              ),
             
            ),
          ],
        ),
      ),
    );
  }
}
