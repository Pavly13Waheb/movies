import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/API/model_movies_api/api_category_movie_list.dart';

import '../home_screen/navbar_home_screens/browse_tab/category_movies_list_view/category_movies_list_view_model.dart';

class WatchListRepo extends ChangeNotifier {
  CategoryMoviesListViewModel listViewModel = CategoryMoviesListViewModel();

  List movieFromFireStoreDocList = [];


  getDataFromFireStore() async {
    CollectionReference movieFromFireStore =
        FirebaseFirestore.instance.collection("Watch List");
    // QuerySnapshot querySnapshot = await movieFromFireStore.get();
    // final movieData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // DocumentSnapshot snapshot = await movieFromFireStore.doc().get();
    // CategoryResultsDM obj = CategoryResultsDM.fromJson(snapshot.data());

    print("====================${obj.title}=============");
  }
}
