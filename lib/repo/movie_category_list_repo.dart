import 'package:flutter/cupertino.dart';
import 'package:movies/API/model_movies_api/api_category_movie_list.dart';

import '../API/api_statics_data.dart';

class MovieCategoryListRepo extends ChangeNotifier{

  List<CategoryResultsDM> results = [];


  void getResults(with_genres) async {
    ApiCategoryMovieListDM apiCategoryMovieListDM =
        await ApiMovieManager.getCategoryMovieList( with_genres: with_genres );
    results = apiCategoryMovieListDM.results!;
    notifyListeners();
  }
}