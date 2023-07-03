import 'dart:convert';
import 'api_popular_class_data.dart';
import 'package:http/http.dart';

class ApiStaticsManager {
  static String apiKeyMovie = "c2d29417c7c637ee6313364c9954b0cc";
  static String apiMovieBaseUrl = "api.themoviedb.org";
  static String apiMoviePopularUrl = "3/movie/popular";
  static String apiMovieTmdbImageUrl = "http://image.tmdb.org/t/p/w500";

  static Future<ApiPopularDM> getPopularData() async {
    Uri url =
        Uri.http(apiMovieBaseUrl, apiMoviePopularUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiPopularDM apiPopularDM = ApiPopularDM.fromJson(json);

    return apiPopularDM;
  }
}
