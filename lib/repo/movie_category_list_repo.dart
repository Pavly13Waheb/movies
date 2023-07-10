import 'package:flutter/cupertino.dart';
import 'package:movies/API/model_movies_api/api_category_movie_list.dart';
import '../API/api_statics_data.dart';

class MovieCategoryListRepo extends ChangeNotifier{

  List<Results> results = [];

  void getResults() async {
    ApiCategoryMovieListDM apiCategoryMovieListDM = await ApiMovieManager.getCategoryMovieList();
    results = apiCategoryMovieListDM.results!;
    notifyListeners();
  }


}