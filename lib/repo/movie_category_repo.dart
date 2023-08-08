import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/API/api_manager_statics_data.dart';

import '../API/model_movies_api/api_category_movie.dart';

class MovieCategoryRepo extends ChangeNotifier {
  List<Genres> genres = [];

  void checkInternetForCategory(
      ApiCategoriesMovieDM apiCategoriesMovieDM) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      getGenres();
      whenInternet(apiCategoriesMovieDM);
    } else {
      withoutInternet();
    }
    notifyListeners();
  }

  void getGenres() async {
    ApiCategoriesMovieDM apiCategoriesMovieDM =
        await ApiMovieManager.getCategory();
    genres = apiCategoriesMovieDM.genres!;
    notifyListeners();
  }

  whenInternet(ApiCategoriesMovieDM apiCategoriesMovieDM) async {
    CollectionReference addGenresList =
        FirebaseFirestore.instance.collection("ApiCategoriesMovieDM");
    await addGenresList.doc("Genres").set(apiCategoriesMovieDM.toJson());
    notifyListeners();
  }

  withoutInternet() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("ApiCategoriesMovieDM");
    DocumentSnapshot snapshot = await collectionReference.doc("Genres").get();
    ApiCategoriesMovieDM obj = ApiCategoriesMovieDM.fromJson(snapshot.data());
    genres = obj.genres!;
    notifyListeners();
  }
}
