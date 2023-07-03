import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_navigator_args.dart';
import 'package:movies/theme/app_material.dart';

class PopularMovieDetails extends StatelessWidget {
  static String routeName = "RouteName";

  const PopularMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as PopularNavigatorArgs;
    num id = arg.id;
    int index = arg.index;

    return Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: getPopularMovieDetails(index, id));
  }

  Widget getPopularMovieDetails(int index, num id) {
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
          if (snapshot.data!.results![index].id == id) {
            return Container(
              color: AppColor.greyColor,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: NetworkImage(
                        ApiStaticsManager.apiMovieTmdbImageUrl +
                            snapshot.data!.results![index].backdropPath
                                .toString(),
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    snapshot.data!.results![index].title.toString(),
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
                            ApiStaticsManager.apiMovieTmdbImageUrl +
                                snapshot.data!.results![index].posterPath
                                    .toString(),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    snapshot.data!.results![index].overview
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )),
                              Text(
                                "releaseDate : ${snapshot.data!.results![index].releaseDate.toString()}  "
                                "voteAverage : ${snapshot.data!.results![index].voteAverage.toString()}  "
                                "voteCount : ${snapshot.data!.results![index].voteCount.toString()}",
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
          } else {
            return getPopularMovieDetails(index, id);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
