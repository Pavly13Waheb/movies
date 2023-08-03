import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/API/model_movies_api/api_category_movie_list.dart';

class WatchListRepo extends ChangeNotifier {
  List movieFromFireStoreDocList = [];

  getDataFromFireStore() async {
    CollectionReference movieFromFireStore =
        FirebaseFirestore.instance.collection("Watch List");
    QuerySnapshot querySnapshot = await movieFromFireStore.get();
    final movieData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print("====================${movieData}=============");
  }
}
