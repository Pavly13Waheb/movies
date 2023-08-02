import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies/API/model_movies_api/api_category_movie.dart';
import 'package:movies/API/model_movies_api/api_category_movie_list.dart';
import 'model_movies_api/api_popular_class_data_model.dart';
import 'model_movies_api/api_top_rated_data_model.dart';
import 'model_movies_api/search_data_model.dart';

class ApiMovieManager {
  static String apiKeyMovie = "c2d29417c7c637ee6313364c9954b0cc";
  static String apiMovieBaseUrl = "api.themoviedb.org";
  static String apiMoviePopularUrl = "3/movie/popular";
  static String apiMovieTMDBImageUrl = "http://image.tmdb.org/t/p/w500";
  static String apiMovieTopRatedUrl = "3/movie/top_rated";
  static String apiMovieSearchUrl = "3/search/movie";
  static String apiCategoryListUrl = "3/genre/movie/list";
  static String apiCategoryMovieListUrl = "3/discover/movie";

  static Future<ApiPopularDM> getPopularData() async {
    Uri url =
        Uri.http(apiMovieBaseUrl, apiMoviePopularUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiPopularDM apiPopularDM = ApiPopularDM.fromJson(json);

    return apiPopularDM;
  }

  static Future<ApiTopRatedDM> getTopRatedData() async {
    Uri url = Uri.http(
        apiMovieBaseUrl, apiMovieTopRatedUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiTopRatedDM apiTopRatedDM = ApiTopRatedDM.fromJson(json);

    return apiTopRatedDM;
  }

  static Future<SearchDM> searchDelegate(
      {required String? searchKeyWord}) async {
    Uri url = Uri.http(apiMovieBaseUrl, apiMovieSearchUrl,
        {"api_key": apiKeyMovie, "query": searchKeyWord});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SearchDM searchDM = SearchDM.fromJson(json);

    return searchDM;
  }

  static Future<ApiCategoriesMovieDM> getCategory() async {
    Uri url =
        Uri.http(apiMovieBaseUrl, apiCategoryListUrl, {"api_key": apiKeyMovie});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiCategoriesMovieDM apiCategoryDM = ApiCategoriesMovieDM.fromJson(json);

    return apiCategoryDM;
  }

  static Future<ApiCategoryMovieListDM> getCategoryMovieList(
      {String? with_genres}) async {
    Uri url = Uri.http(apiMovieBaseUrl, apiMovieTopRatedUrl,
        {"api_key": apiKeyMovie, "with_genres": with_genres});
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    ApiCategoryMovieListDM apiCategoryMovieListDM =
        ApiCategoryMovieListDM.fromJson(json);

    return apiCategoryMovieListDM;
  }
}
