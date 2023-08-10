import 'package:flutter/foundation.dart';

import '../API/api_manager_statics_data.dart';
import '../API/model_movies_api/api_top_rated_data_model.dart';

class MoviesTopRatedRepo extends ChangeNotifier {
  List<TopRatedResultsDM> results = [];

  void getResults() async {
    ApiTopRatedDM apiTopRatedDM = await ApiMovieManager.getTopRatedData();
    results = apiTopRatedDM.results!;
    notifyListeners();
  }
}
