import 'dart:convert';
import 'package:movies/API/api_latest_data/api_latest_movie_data_model.dart';
import 'package:http/http.dart';
import 'package:movies/API/popular_api/api_popular_class_data.dart';

class ApiStaticsManager {
  static String apiKeyMovie = "c2d29417c7c637ee6313364c9954b0cc";
  static String apiMovieBaseUrl = "api.themoviedb.org";
  static String apiMoviePopularUrl = "3/movie/popular";
  static String apiMovieTmdbImageUrl = "http://image.tmdb.org/t/p/w500";
  static String apiMovieLatestUrl = "3/movie/latest";

  static Future<ApiPopularDM> getPopularData() async {
    Uri url =
        Uri.http(apiMovieBaseUrl, apiMoviePopularUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiPopularDM apiPopularDM = ApiPopularDM.fromJson(json);

    return apiPopularDM;
  }

  static Future<ApiLatestMovieDM> getLatestData() async {
    Uri url =
    Uri.http(apiMovieBaseUrl, apiMovieLatestUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiLatestMovieDM apiLatestDM = ApiLatestMovieDM.fromJson(json);

    return apiLatestDM;
  }
}
