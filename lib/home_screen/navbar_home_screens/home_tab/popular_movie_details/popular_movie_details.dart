import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import 'package:movies/theme/app_material.dart';
import '../../../model/movie_details/movie_details_arg.dart';

class PopularMovieDetails extends StatefulWidget {
  static String routeName = "RouteName";

  @override
  State<PopularMovieDetails> createState() => _PopularMovieDetailsState();
}

class _PopularMovieDetailsState extends State<PopularMovieDetails> {
  @override
  Widget build(BuildContext context) {
    var populareArg =
        ModalRoute.of(context)?.settings.arguments as MovieDetailsArg;

    String? backdropPath = populareArg.backdropPath;
    String? originalLanguage = populareArg.originalLanguage;
    String? originalTitle = populareArg.originalTitle;
    String? overview = populareArg.overview;
    String? posterPath = populareArg.posterPath;
    String? releaseDate = populareArg.releaseDate;
    String? title = populareArg.title;
    num? voteAverage = populareArg.voteAverage;
    num? voteCount = populareArg.voteCount;

    return Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: getPopularMovieDetails(
          backdropPath,
          originalLanguage,
          originalTitle,
          overview,
          posterPath,
          releaseDate,
          title,
          voteAverage,
          voteCount,
        ));
  }

  Widget getPopularMovieDetails(
      String? backdropPath,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      String? posterPath,
      String? releaseDate,
      String? title,
      num? voteAverage,
      num? voteCount) {
    return Container(
      color: AppColor.greyColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(
                ApiMovieManager.apiMovieTMDBImageUrl +
                      backdropPath.toString(),
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
            title.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: ApiMovieManager.apiMovieTMDBImageUrl +
                        posterPath.toString(),

                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(context).size.width *
                                    0.02),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              overview.toString(),
                              style:
                              Theme.of(context).textTheme.labelSmall,
                            )),
                        Text(
                        "releaseDate : ${releaseDate.toString()}  "
                        "voteAverage : ${voteAverage.toString()}  "
                        "voteCount : ${voteCount.toString()}",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
