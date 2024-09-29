import 'package:movies_app/shared/moviesMain.dart';

class WatchListModel {
  MoviesMain movie;
  bool isWatchList;

  WatchListModel({
    required this.movie,
    this.isWatchList = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': movie.id,
      'title': movie.title,
      'posterPath': movie.posterPath,
      'overview': movie.overview,
      'releaseDate': movie.releaseDate,
      'isWatchList': isWatchList,
    };
  }

  static WatchListModel fromJson(Map<String, dynamic> json) {
    MoviesMain movie = MoviesMain.fromJson(json);
    return WatchListModel(
      movie: movie,
      isWatchList: json['isWatchList'],
    );
  }
}
