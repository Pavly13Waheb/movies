import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import 'package:movies/home_screen/navbar_home_screens/watch_list_tab/watch_list_view_model.dart';
import 'package:provider/provider.dart';
import '../../../theme/app_material.dart';
import '../../model/movie_details/movie_details.dart';
import '../../model/movie_details/movie_details_arg.dart';

// ignore: use_key_in_widget_constructors
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
      create: (context) {
        return watchListViewModel.watchListRepo;
      },
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
          body: checkCategoryList(),
        );
      },
    );
  }

  Widget checkCategoryList() {
    if (watchListViewModel.watchListRepo.movieFromFireStoreDocList.isNotEmpty) {
      return moviesListFromFireStore();
    } else if (watchListViewModel
        .watchListRepo.movieFromFireStoreDocList.isEmpty) {
      return Center(
          child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: const CircularProgressIndicator()));
    } else {
      return checkCategoryList();
    }
  }

  Widget moviesListFromFireStore() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: width * 0.08,
          mainAxisSpacing: height * 0.02),
      itemCount:
          watchListViewModel.watchListRepo.movieFromFireStoreDocList.length,
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
                            watchListViewModel.watchListRepo
                                .movieResultFromFireStore.posterPath
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
                        MovieDetails.routeName,
                        arguments: MovieDetailsArg(
                          title: watchListViewModel
                              .watchListRepo.movieResultFromFireStore.title,
                          backdropPath: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.backdropPath,
                          originalLanguage: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.originalLanguage,
                          originalTitle: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.originalTitle,
                          overview: watchListViewModel
                              .watchListRepo.movieResultFromFireStore.overview,
                          posterPath: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.posterPath,
                          releaseDate: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.releaseDate,
                          voteAverage: watchListViewModel.watchListRepo
                              .movieResultFromFireStore.voteAverage,
                          voteCount: watchListViewModel
                              .watchListRepo.movieResultFromFireStore.voteCount,
                        ),
                      );
                    },
                    child: Text(
                      watchListViewModel
                          .watchListRepo.movieResultFromFireStore.title
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
