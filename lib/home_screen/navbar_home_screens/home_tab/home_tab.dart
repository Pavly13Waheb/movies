import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_movie_details.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_navigator_args.dart';
import 'package:movies/theme/app_material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return popularMovieView(index);
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
              color: AppColor.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Rated",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return topRatedMovieView(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularMovieView(int index) {
    return Container(
      color: Colors.grey.shade900,
      alignment: Alignment.center,
      child: FutureBuilder(
        future: ApiManager.getPopularData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "ERROR",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(ApiManager.apiMovieTmdbImageUrl +
                        snapshot.data!.results![index].backdropPath!),
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          image: NetworkImage(
                              ApiManager.apiMovieTmdbImageUrl +
                                  snapshot.data!.results![index].posterPath!),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PopularMovieDetails.routeName,
                                      arguments: PopularNavigatorArgs(
                                          id: snapshot
                                              .data!.results![index].id!,
                                          index: index));
                                },
                                child: Text(
                                  snapshot.data!.results![index].title
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Text(
                                "releaseDate : ${snapshot.data!.results![index].releaseDate.toString()}   "
                                "voteAverage : ${snapshot.data!.results![index].voteAverage.toString()}   "
                                "voteCount : ${snapshot.data!.results![index].voteCount.toString()}   ",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget topRatedMovieView(int index) {
    return
      Column(
      children: [
        FutureBuilder(
          future: ApiManager.getTopRatedData(),
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
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Image(
                          width: MediaQuery.of(context).size.width * 0.37,
                          image: NetworkImage(
                              ApiManager.apiMovieTmdbImageUrl +
                                  snapshot.data!.results![index].posterPath!)),
                    ),
                    Text(textAlign: TextAlign.center,
                      snapshot.data!.results![index].title!,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              );
            } else {
              return  Center(child: CircularProgressIndicator());
            }
          },
        )
      ],
    );
  }
}
