import 'package:flutter/material.dart';
import 'package:movies/repo/top_rated_movies_repo.dart';
import 'package:provider/provider.dart';

import '../../../../API/api_manager_statics_data.dart';
import '../../../model/movie_details/movie_details.dart';
import '../../../model/movie_details/movie_details_arg.dart';

class TopRatedView extends StatefulWidget {
  @override
  State<TopRatedView> createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  MoviesTopRatedRepo moviesTopRatedRepo = MoviesTopRatedRepo();

  @override
  void initState() {
    // TODO: implement initState
    moviesTopRatedRepo.getResults();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => moviesTopRatedRepo,
      builder: (context, child) {
        moviesTopRatedRepo = Provider.of(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .02),
          child: Column(
            children: [
              SizedBox(
                height: height * .35,
                child: ListView.builder(
                  itemCount: moviesTopRatedRepo.results.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width * 0.4,
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Image(
                                width: width * 0.37,
                                image: NetworkImage(
                                    ApiMovieManager.apiMovieTMDBImageUrl +
                                        moviesTopRatedRepo
                                            .results[index].posterPath!)),
                          ),
                          InkWell(
                            child: Text(
                              textAlign: TextAlign.center,
                              moviesTopRatedRepo.results[index].title!,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MovieDetails.routeNameMovieDetails,
                                arguments: MovieDetailsArg(
                                  title:
                                      moviesTopRatedRepo.results[index].title,
                                  backdropPath: moviesTopRatedRepo
                                      .results[index].backdropPath,
                                  originalLanguage: moviesTopRatedRepo
                                      .results[index].originalLanguage,
                                  originalTitle: moviesTopRatedRepo
                                      .results[index].originalTitle,
                                  overview: moviesTopRatedRepo
                                      .results[index].overview,
                                  posterPath: moviesTopRatedRepo
                                      .results[index].posterPath,
                                  releaseDate: moviesTopRatedRepo
                                      .results[index].releaseDate,
                                  voteAverage: moviesTopRatedRepo
                                      .results[index].voteAverage,
                                  voteCount: moviesTopRatedRepo
                                      .results[index].voteCount,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
