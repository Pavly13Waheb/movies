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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: popularMovieView(height, width)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              color: AppColor.greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Rated",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Expanded(child: topRatedMovieView(height, width)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularMovieView(var height, var width) {
    return Container(
      width: width,
      color: Colors.grey.shade900,
      alignment: Alignment.center,
      child: FutureBuilder(
        future: ApiMovieManager.getPopularData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "ERROR",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image(
                      width: width,
                      image: NetworkImage(ApiMovieManager.apiMovieTMDBImageUrl +
                          snapshot.data!.results![index].backdropPath!),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image(
                            image: NetworkImage(
                                ApiMovieManager.apiMovieTMDBImageUrl +
                                    snapshot.data!.results![index].posterPath!),
                            height: height * 0.3,
                            width: width * 0.3,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.02,
                                horizontal: width * 0.03),
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
                                Container(
                                  width: width * .3,
                                  child: Text(
                                    "releaseDate : ${snapshot.data!.results![index].releaseDate.toString()}   "
                                    "voteAverage : ${snapshot.data!.results![index].voteAverage.toString()}   "
                                    "voteCount : ${snapshot.data!.results![index].voteCount.toString()}   ",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget topRatedMovieView(var height, var width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiMovieManager.getTopRatedData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "ERROR",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return SizedBox(
                    height: height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.4,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                child: Image(
                                    width: width * 0.37,
                                    image: NetworkImage(
                                        ApiMovieManager.apiMovieTMDBImageUrl +
                                            snapshot.data!.results![index]
                                                .posterPath!)),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  snapshot.data!.results![index].title!,
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ],
                            ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
