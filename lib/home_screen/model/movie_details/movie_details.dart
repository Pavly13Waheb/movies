import 'package:flutter/material.dart';
import '../../../../../API/api_statics_data.dart';
import '../../../../../theme/app_material.dart';
import 'movie_details_arg.dart';

class MovieDetails extends StatefulWidget {
  static String routeName = "RouteName";

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as MovieDetailsArg;

    String? backdropPath = arg.backdropPath;
    String? originalLanguage = arg.originalLanguage;
    String? originalTitle = arg.originalTitle;
    String? overview = arg.overview;
    String? posterPath = arg.posterPath;
    String? releaseDate = arg.releaseDate;
    String? title = arg.title;
    num? voteAverage = arg.voteAverage;
    num? voteCount = arg.voteCount;

    return Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: MovieWidgetDetails(
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

  Widget MovieWidgetDetails(
      String? backdropPath,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      String? posterPath,
      String? releaseDate,
      String? title,
      num? voteAverage,
      num? voteCount) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: Container(
        color: AppColor.greyColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02),
              width: MediaQuery.of(context).size.width,
              child:

              Image(
                image: NetworkImage(
                  ApiMovieManager.apiMovieTMDBImageUrl + backdropPath.toString(),
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
                Image(
                  width: MediaQuery.of(context).size.width * 0.3,
                  image: NetworkImage(
                    ApiMovieManager.apiMovieTMDBImageUrl +
                        posterPath.toString(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              overview.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
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
      ),
    );
  }
}
