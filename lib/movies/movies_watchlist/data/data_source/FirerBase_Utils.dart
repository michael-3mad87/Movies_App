import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/shared/moviesMain.dart';

class FirebaseUtils {
  static CollectionReference<MoviesMain> getWatchListCollection() {
    final db = FirebaseFirestore.instance;
    return db.collection('watchListMovies').withConverter(
          fromFirestore: (snapshot, _) => MoviesMain.fromJson(snapshot.data()!),
          toFirestore: (movie, options) => movie.toJson(),
        );
  }

  static Future<void> addMovieToWatchList(MoviesMain movie) async {
    final collectionReference = getWatchListCollection();
    final doc = collectionReference.doc(movie.id.toString());
    return doc.set(movie);
  }

  static Future<void> deleteMovieFromWatchList(int movieId) {
    final collectionReference = getWatchListCollection();
    final doc = collectionReference.doc(movieId.toString());
    return doc.delete();
  }

  static Future<List<MoviesMain>> getWatchListMovies() async {
    final collectionReference = getWatchListCollection();
    final querySnapshot = await collectionReference.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> updateMovieWatchListStatus(
      int movieId, bool isWatchList) async {
    final collectionReference = getWatchListCollection();
    final doc = collectionReference.doc(movieId.toString());

    try {
      await doc.update({'isWatchList': isWatchList});
    } catch (e) {
      print("Error updating movie's watchlist status: $e");
      throw Exception("Failed to update movie's watchlist status");
    }
  }
}
