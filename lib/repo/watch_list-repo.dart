import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../API/model_movies_api/api_category_movie_list.dart';
import '../home_screen/navbar_home_screens/browse_tab/category_movies_list_view/category_movies_list_view_model.dart';

class WatchListRepo extends ChangeNotifier {
  CategoryMoviesListViewModel listViewModel = CategoryMoviesListViewModel();

  late CategoryResultsDM movieResultFromFireStore ;
  List movieFromFireStoreDocList = [];



  getDataFromFireStore() async {
    CollectionReference movieFromFireStore =
        FirebaseFirestore.instance.collection("Watch List");
     QuerySnapshot querySnapshot = await movieFromFireStore.get();
     final movieData = querySnapshot.docs.map((doc) => doc.data()).toList();


     for(int i = 0 ; i < movieData.length ; i++){
       movieFromFireStoreDocList.add(movieData[i]);
        movieResultFromFireStore = CategoryResultsDM.fromJson(movieFromFireStoreDocList[i]);
       print("===============${movieResultFromFireStore.title}=============");
     }

    notifyListeners();

  }
}
