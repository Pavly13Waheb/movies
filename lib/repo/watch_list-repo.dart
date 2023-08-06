import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/home_screen/login/login_view.dart';

import '../API/model_movies_api/api_category_movie_list.dart';

class WatchListRepo extends ChangeNotifier {
  List<CategoryResultsDM> movieResultFromFireStoreDocList = [];

  getDataFromFireStore() async {
    CollectionReference movieFromFireStore =
        FirebaseFirestore.instance.collection(LoginView.userName!);
    QuerySnapshot querySnapshot = await movieFromFireStore.get();
    final movieData = querySnapshot.docs.map((doc) => doc.data()).toList();
    await loopForMovieOObjects(movieData);

    notifyListeners();
  }

  loopForMovieOObjects(movieData) {
    for (int i = 0; i < movieData.length; i++) {
      CategoryResultsDM movieResultFromFireStore =
          CategoryResultsDM.fromJson(movieData[i]);
      movieResultFromFireStoreDocList.add(movieResultFromFireStore);
    }
  }
}
