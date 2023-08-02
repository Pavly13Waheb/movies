import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/API/model_movies_api/api_top_rated_data_model.dart';

import '../API/model_movies_api/api_category_movie_list.dart';

class WatchListRepo extends ChangeNotifier {
  List watchList = [];


  getDataFromFireStore() async {
    CollectionReference movieFromFireStore =
        FirebaseFirestore.instance.collection("Watch List");
    DocumentSnapshot snapshot = await movieFromFireStore.doc("Interstellar").get();
    CategoryResultsDM movieData = CategoryResultsDM.fromJson(snapshot.data());
     //watchList = movieData as List;
    print("====================${movieData.title}=============");
  }
}
