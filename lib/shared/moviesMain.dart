import 'package:movies_app/movies/movies_details/movie_details/data/model/movie_details_response/movie_details_response.dart';

class MoviesMain {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  late bool isWatchList;

  MoviesMain({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.isWatchList = false,
  });

  factory MoviesMain.fromMovieDetailsResponse(MovieDetailsResponse response) {
    return MoviesMain(
      adult: response.adult,
      backdropPath: response.backdropPath,
      id: response.id,
      originalLanguage: response.originalLanguage,
      originalTitle: response.originalTitle,
      overview: response.overview,
      popularity: response.popularity,
      posterPath: response.posterPath,
      releaseDate: response.releaseDate,
      title: response.title,
      video: response.video,
      voteAverage: response.voteAverage,
      voteCount: response.voteCount,
      genreIds: response.genres
              ?.where((genre) => genre.id != null)
              .map((genre) => genre.id!)
              .toList() ??
          [],
      isWatchList: false,
    );
  }

  MoviesMain.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    isWatchList = json['isWatchList'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['isWatchList'] = isWatchList;
    return data;
  }
}
