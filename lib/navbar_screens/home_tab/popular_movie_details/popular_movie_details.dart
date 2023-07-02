import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';

class PopularMovieDetails extends StatelessWidget {
  static String routeName = "RouteName";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return getPopularMovieDetails(index);
        },
      ),
    );
    ;
  }

  Widget getPopularMovieDetails(int index) {
    return FutureBuilder(
      future: ApiStaticsManager.getPopularData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "ERROR",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        } else if (snapshot.hasData) {
          return Container(
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: NetworkImage(
                      ApiStaticsManager.apiMovieTmdbImageUrl +
                          snapshot.data!.results![index].backdropPath
                              .toString(),
                    ),
                  ),
                ),
                Text(textAlign: TextAlign.center,
                  snapshot.data!.results![index].title.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    children: [
                      Container(
                        child: Image(width: MediaQuery.of(context).size.width * 0.2,
                          image: NetworkImage(
                            ApiStaticsManager.apiMovieTmdbImageUrl +
                                snapshot.data!.results![index].posterPath
                                    .toString(),
                          ),

                        ),
                      ),
                      Column(
                        children: [

                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Expanded(
                                child: Text(
                                  snapshot.data!.results![index].overview
                                      .toString(),
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              )),
                          Text(
                            "releaseDate : ${snapshot.data!.results![index].releaseDate.toString()}  "
                            "voteAverage : ${snapshot.data!.results![index].voteAverage.toString()}  "
                            "voteCount : ${snapshot.data!.results![index].voteCount.toString()}",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
