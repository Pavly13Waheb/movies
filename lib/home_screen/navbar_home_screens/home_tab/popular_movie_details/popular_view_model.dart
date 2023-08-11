import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_movies.dart';
import 'package:movies/repo/movie_popular_repo.dart';

class PopularViewModel extends StatefulWidget {
  @override
  State<PopularViewModel> createState() => _PopularViewModelState();
}

class _PopularViewModelState extends State<PopularViewModel> {
  MoviesPopularRepo moviesPopularRepo = MoviesPopularRepo();

  @override
  void initState() {
    // TODO: implement initState
    moviesPopularRepo.getResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return checkPopularList();
  }

  checkPopularList() {
    if (moviesPopularRepo.results.isNotEmpty) {
      return PopularView();
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
}
