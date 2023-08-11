import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/repo/movie_popular_repo.dart';
import 'package:provider/provider.dart';

import '../../../../API/api_manager_statics_data.dart';
import '../../../model/movie_details/movie_details.dart';
import '../../../model/movie_details/movie_details_arg.dart';

class PopularView extends StatefulWidget {
  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  MoviesPopularRepo moviesPopularRepo = MoviesPopularRepo();

  @override
  void initState() {
    // TODO: implement initState
    moviesPopularRepo.getResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => moviesPopularRepo,
      builder: (context, child) {
        moviesPopularRepo = Provider.of(context);
        return popularMovieView();
      },
    );
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
              CachedNetworkImage(
                imageUrl: (ApiMovieManager.apiMovieTMDBImageUrl +
                    moviesPopularRepo.results[index].backdropPath!),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                                context,
                                MovieDetails.routeNameMovieDetails,
                                arguments: MovieDetailsArg(
                                  title: moviesPopularRepo.results[index].title,
                                  backdropPath: moviesPopularRepo
                                      .results[index].backdropPath,
                                  originalLanguage: moviesPopularRepo
                                      .results[index].originalLanguage,
                                  originalTitle: moviesPopularRepo
                                      .results[index].originalTitle,
                                  overview:
                                      moviesPopularRepo.results[index].overview,
                                  posterPath: moviesPopularRepo
                                      .results[index].posterPath,
                                  releaseDate: moviesPopularRepo
                                      .results[index].releaseDate,
                                  voteAverage: moviesPopularRepo
                                      .results[index].voteAverage,
                                  voteCount: moviesPopularRepo
                                      .results[index].voteCount,
                                ),
                              );
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
}
