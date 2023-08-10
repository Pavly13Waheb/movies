import 'package:flutter/material.dart';

import '../../../../../API/api_manager_statics_data.dart';
import '../../../../../theme/app_material.dart';
import 'movie_details_arg.dart';

class MovieDetails extends StatefulWidget {
  static String routeNameMovieDetails = "RouteName";

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as MovieDetailsArg;

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: movieWidgetDetails(arg),
    );
  }

  Widget movieWidgetDetails(arg) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title!),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: height * 0.02),
        color: AppColor.greyColor,
        width: width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: height * 0.02),
              width: width,
              child: Image(
                image: NetworkImage(
                  ApiMovieManager.apiMovieTMDBImageUrl +
                      arg.backdropPath.toString(),
                ),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              arg.title.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: width * 0.3,
                    image: NetworkImage(
                      ApiMovieManager.apiMovieTMDBImageUrl +
                          arg.posterPath.toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            width: width,
                            child: Text(
                              arg.overview.toString(),
                              style: Theme.of(context).textTheme.labelSmall,
                            )),
                        Text(
                          "releaseDate : ${arg.releaseDate.toString()}  "
                          "voteAverage : ${arg.voteAverage.toString()}  "
                          "voteCount : ${arg.voteCount.toString()}",
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
