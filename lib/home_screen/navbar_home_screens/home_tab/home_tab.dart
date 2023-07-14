import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_movie_details.dart';
import 'package:movies/repo/movie_populare_repo.dart';
import 'package:movies/theme/app_material.dart';
import 'package:provider/provider.dart';

import '../../model/movie_details/movie_details_arg.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MoviesPopularRepo moviesPopularRepo = MoviesPopularRepo();

  @override
  void initState() {
    moviesPopularRepo.getResults();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => moviesPopularRepo,
      builder: (context, child) {
        moviesPopularRepo = Provider.of(context);
        return Container(
          width: width,
          padding: EdgeInsets.only(top: height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: checkPopularList()),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.03),
                  color: AppColor.greyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Rated",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Expanded(child: topRatedMovieView()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  checkPopularList() {
    if (moviesPopularRepo.results.isNotEmpty) {
      return popularMovieView();
    } else if (moviesPopularRepo.results.isEmpty) {
      return Center(
          child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: const CircularProgressIndicator()));
    } else {
      return checkPopularList();
    }
  }

  Widget popularMovieView() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      color: Colors.grey.shade900,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: moviesPopularRepo.results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image(
                width: width,
                image: NetworkImage(ApiMovieManager.apiMovieTMDBImageUrl +
                    moviesPopularRepo.results[index].backdropPath!),
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image(
                      image: NetworkImage(ApiMovieManager.apiMovieTMDBImageUrl +
                          moviesPopularRepo.results[index].posterPath!),
                      height: height * 0.3,
                      width: width * 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PopularMovieDetails.routeName,
                                  arguments: MovieDetailsArg(
                                    title:
                                        moviesPopularRepo.results[index].title,
                                    backdropPath: moviesPopularRepo
                                        .results[index].backdropPath,
                                    originalLanguage: moviesPopularRepo
                                        .results[index].originalLanguage,
                                    originalTitle: moviesPopularRepo
                                        .results[index].originalTitle,
                                    overview: moviesPopularRepo
                                        .results[index].overview,
                                    posterPath: moviesPopularRepo
                                        .results[index].posterPath,
                                    releaseDate: moviesPopularRepo
                                        .results[index].releaseDate,
                                    voteAverage: moviesPopularRepo
                                        .results[index].voteAverage,
                                    voteCount: moviesPopularRepo
                                        .results[index].voteCount,
                                  ));
                            },
                            child: Text(
                              moviesPopularRepo.results[index].title.toString(),
                              style: const TextStyle(color: Colors.white),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Container(
                            width: width * .3,
                            child: Text(
                              "releaseDate : ${moviesPopularRepo.results[index].releaseDate.toString()}   "
                              "voteAverage : ${moviesPopularRepo.results[index].voteAverage.toString()}   "
                              "voteCount : ${moviesPopularRepo.results[index].voteCount.toString()}   ",
                              style: Theme.of(context).textTheme.labelSmall,
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
      ),
    );
  }

  Widget topRatedMovieView() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
