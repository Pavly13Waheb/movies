import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/top_rated_movies/top_rated_view.dart';

import '../../../../repo/top_rated_movies_repo.dart';

class TopRatedViewmodel extends StatefulWidget {
  @override
  State<TopRatedViewmodel> createState() => _TopRatedViewmodelState();
}

class _TopRatedViewmodelState extends State<TopRatedViewmodel> {
  MoviesTopRatedRepo moviesTopRatedRepo = MoviesTopRatedRepo();

  @override
  void initState() {
    // TODO: implement initState
    moviesTopRatedRepo.getResults();
  }

  @override
  Widget build(BuildContext context) {
    return checkTopRatedList();
  }

  checkTopRatedList() {
    if (moviesTopRatedRepo.results.isNotEmpty) {
      return TopRatedView();
    } else if (moviesTopRatedRepo.results.isEmpty) {
      return Center(
          child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: const CircularProgressIndicator()));
    } else {
      return checkTopRatedList();
    }
  }
}
