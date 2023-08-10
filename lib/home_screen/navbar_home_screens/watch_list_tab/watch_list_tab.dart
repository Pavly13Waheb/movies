import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import 'package:movies/home_screen/navbar_home_screens/watch_list_tab/watch_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_material.dart';
import '../../model/movie_details/movie_details.dart';
import '../../model/movie_details/movie_details_arg.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  WatchListViewModel watchListViewModel = WatchListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    watchListViewModel.watchListRepo.getDataFromFireStore();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => watchListViewModel.watchListRepo,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Watch List",
                style:
                    TextStyle(fontSize: 30, color: AppColor.darkYellowColor)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
            ],
          ),
          body: watchListViewModel.checkWatchList(
              moviesListFromFireStore: moviesListFromFireStore,
              setState: setState),
        );
      },
    );
  }

  Widget moviesListFromFireStore() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: width * 0.08,
          mainAxisSpacing: height * 0.02),
      itemCount: watchListViewModel
          .watchListRepo.movieResultFromFireStoreDocList.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Image(
                      height: height * 0.3,
                      width: width * 0.40,
                      image: NetworkImage(
                        ApiMovieManager.apiMovieTMDBImageUrl +
                            watchListViewModel
                                .watchListRepo
                                .movieResultFromFireStoreDocList[index]
                                .posterPath
                                .toString(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MovieDetails.routeNameMovieDetails,
                        arguments: MovieDetailsArg(
                          title: watchListViewModel.watchListRepo
                              .movieResultFromFireStoreDocList[index].title,
                          backdropPath: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .backdropPath,
                          originalLanguage: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .originalLanguage,
                          originalTitle: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .originalTitle,
                          overview: watchListViewModel.watchListRepo
                              .movieResultFromFireStoreDocList[index].overview,
                          posterPath: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .posterPath,
                          releaseDate: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .releaseDate,
                          voteAverage: watchListViewModel
                              .watchListRepo
                              .movieResultFromFireStoreDocList[index]
                              .voteAverage,
                          voteCount: watchListViewModel.watchListRepo
                              .movieResultFromFireStoreDocList[index].voteCount,
                        ),
                      );
                    },
                    child: Text(
                      watchListViewModel.watchListRepo
                          .movieResultFromFireStoreDocList[index].title
                          .toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
