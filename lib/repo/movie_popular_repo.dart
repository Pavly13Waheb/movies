import 'package:flutter/foundation.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import '../API/model_movies_api/api_popular_class_data_model.dart';

class MoviesPopularRepo extends ChangeNotifier {
  List<PopularResultsDM> results = [];

  void getResults() async {
    ApiPopularDM apiPopularDM = await ApiMovieManager.getPopularData();
    results = apiPopularDM.results!;
    notifyListeners();
  }
}
