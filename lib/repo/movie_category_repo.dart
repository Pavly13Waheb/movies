import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/API/api_statics_data.dart';
import '../API/model_movies_api/api_category_movie.dart';

class MovieCategoryRepo extends ChangeNotifier {
  List<Genres> genres = [];

  void getGenres() async {
    ApiCategoriesMovieDM apiCategoriesMovieDM =
        await ApiMovieManager.getCategory();
    genres = apiCategoriesMovieDM.genres!;
    notifyListeners();}

  void checkInternetForCategory(ApiCategoriesMovieDM apiCategoriesMovieDM)async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      CollectionReference addListIndex =
      FirebaseFirestore.instance.collection("List");
      await addListIndex
          .doc('dsa')
          .set(apiCategoriesMovieDM.toJson());
      print('YAY! Free cute dog pics!');
    } else {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("List");
      DocumentSnapshot snapshot = await collectionReference.doc("dsa").get();
      ApiCategoriesMovieDM obj = ApiCategoriesMovieDM.fromJson(snapshot.data());
      print("================= ${obj.genres}==========");
      print('No internet :( Reason:');
    }
  }
}
