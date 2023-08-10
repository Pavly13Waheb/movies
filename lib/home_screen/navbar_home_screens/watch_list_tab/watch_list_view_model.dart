import 'package:flutter/material.dart';
import 'package:movies/repo/watch_list-repo.dart';

class WatchListViewModel {
  WatchListRepo watchListRepo = WatchListRepo();

  checkWatchList(
      {required Function moviesListFromFireStore, required Function setState}) {
    if (watchListRepo.movieResultFromFireStoreDocList.isNotEmpty) {
      return moviesListFromFireStore();
    } else if (watchListRepo.movieResultFromFireStoreDocList.isEmpty) {
      return Center(
          child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: const CircularProgressIndicator()));
    } else {
      return checkWatchList(
          moviesListFromFireStore: moviesListFromFireStore, setState: setState);
    }
  }
}
