import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_view_model.dart';
import 'package:movies/home_screen/navbar_home_screens/home_tab/top_rated_movies/top_rated_view_model.dart';
import 'package:movies/repo/movie_popular_repo.dart';
import 'package:movies/repo/top_rated_movies_repo.dart';
import 'package:movies/theme/app_material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MoviesPopularRepo moviesPopularRepo = MoviesPopularRepo();
  MoviesTopRatedRepo moviesTopRatedRepo = MoviesTopRatedRepo();

  @override
  void initState() {
    moviesPopularRepo.getResults();
    moviesTopRatedRepo.getResults();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => moviesPopularRepo,
              builder: (context, child) {
                moviesPopularRepo = Provider.of(context);
                return PopularViewModel();
              },
            ),
          ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => moviesTopRatedRepo,
              builder: (context, child) {
                moviesTopRatedRepo = Provider.of(context);
                return Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  color: AppColor.greyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Rated",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Expanded(child: TopRatedViewmodel()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
