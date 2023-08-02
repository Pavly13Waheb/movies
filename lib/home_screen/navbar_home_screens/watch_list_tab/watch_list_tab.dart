import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import 'package:movies/API/model_movies_api/api_category_movie.dart';
import 'package:movies/home_screen/navbar_home_screens/watch_list_tab/watch_list_view_model.dart';
import 'package:movies/repo/movie_category_repo.dart';
import 'package:provider/provider.dart';

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
ApiMovieManager.getTopRatedData();
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
            title:  Text("watchListViewModel.watchListRepo.watchList[0]"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
