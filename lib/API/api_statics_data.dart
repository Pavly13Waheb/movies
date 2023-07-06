import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies/API/api_top_rated_movie/api_top_rated_data_model.dart';
import 'package:movies/API/popular_api/api_popular_class_data_model.dart';
import 'package:movies/API/search_api_movie/Search_data_model.dart';

class ApiStaticsManager {
  static String apiKeyMovie = "c2d29417c7c637ee6313364c9954b0cc";
  static String apiMovieBaseUrl = "api.themoviedb.org";
  static String apiMoviePopularUrl = "3/movie/popular";
  static String apiMovieTmdbImageUrl = "http://image.tmdb.org/t/p/w500";
  static String apiMovieTopRatedUrl = "3/movie/top_rated";
  static String apiMovieSearchUrl = "3/search/movie";



  static Future<ApiPopularDM> getPopularData() async {
    Uri url =
        Uri.http(apiMovieBaseUrl, apiMoviePopularUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiPopularDM apiPopularDM = ApiPopularDM.fromJson(json);

    return apiPopularDM;
  }


  static Future<ApiTopRatedDM> getTopRatedData() async {
    Uri url =
    Uri.http(apiMovieBaseUrl, apiMovieTopRatedUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiTopRatedDM apiTopRatedDM = ApiTopRatedDM.fromJson(json);

    return apiTopRatedDM;
  }

  static Future<SearchDM> searchDelegate({required String? searchKeyWord}) async {
    Uri url =
    Uri.http(apiMovieBaseUrl, apiMovieSearchUrl, {"api_key": apiKeyMovie,"query" : searchKeyWord});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SearchDM searchDM = SearchDM.fromJson(json);

    return searchDM;
  }
}
