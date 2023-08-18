import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../provider/provider.dart';
import '../../../../repo/movie_category_list_repo.dart';

class CategoryMoviesListViewModel {
  MovieCategoryListRepo categoryListRepo = MovieCategoryListRepo();

  checkCategoryList({Widget? categoryMoviesListModel, Function? setState}) {
    if (categoryListRepo.results.isNotEmpty) {
      return categoryMoviesListModel;
    } else if (categoryListRepo.results.isEmpty) {
      return Center(
          child: InkWell(
              onTap: () {
                setState!(() {});
              },
              child: const CircularProgressIndicator()));
    } else {
      return checkCategoryList();
    }
  }

  addMoviesToFirebase(int index) {
    CollectionReference movie =
        FirebaseFirestore.instance.collection(AppProvider.userNameLogin!);
    movie
        .doc(categoryListRepo.results[index].title)
        .set(categoryListRepo.results[index].toJson());
  }
}
