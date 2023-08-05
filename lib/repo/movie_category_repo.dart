import 'package:flutter/cupertino.dart';
import 'package:movies/API/api_manager_statics_data.dart';

import '../API/model_movies_api/api_category_movie.dart';

class MovieCategoryRepo extends ChangeNotifier {
  List<Genres> genres = [];

  void getGenres() async {
    ApiCategoriesMovieDM apiCategoriesMovieDM =
        await ApiMovieManager.getCategory();
    genres = apiCategoriesMovieDM.genres!;
    notifyListeners();}

}
