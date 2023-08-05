import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movie_list/category_movies_list_args.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movies_list_view/category_movies_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../API/api_manager_statics_data.dart';
import '../../../../theme/app_material.dart';
import '../../../model/movie_details/movie_details.dart';
import '../../../model/movie_details/movie_details_arg.dart';

class CategoryMoviesList extends StatefulWidget {
  static String routeName = "CategoryMoviesList";

  @override
  State<CategoryMoviesList> createState() => _CategoryMoviesListState();
}

class _CategoryMoviesListState extends State<CategoryMoviesList> {
  //MovieCategoryListRepo categoryListRepo = MovieCategoryListRepo();
  CategoryMoviesListViewModel listViewModel = CategoryMoviesListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    ApiMovieManager.getCategoryMovieList();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as CategoryMoviesListArgs;
    int id = arg.id;
    String name = arg.name;
    listViewModel.categoryListRepo.getResults(id.toString());

    return ChangeNotifierProvider(
      create: (context) => listViewModel.categoryListRepo,
      builder: (context, child) {
        listViewModel.categoryListRepo = Provider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
            centerTitle: true,
          ),
          body: checkCategoryList(),
        );
      },
    );
  }

  Widget checkCategoryList() {
    if (listViewModel.categoryListRepo.results.isNotEmpty) {
      return categoryMoviesListModel();
    } else if (listViewModel.categoryListRepo.results.isEmpty) {
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

  Widget categoryMoviesListModel() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return
      GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: width * 0.08,
          mainAxisSpacing: height * 0.02),
      itemCount: listViewModel.categoryListRepo.results.length,
      itemBuilder: (context, index) {
        return Stack(children: [
          Column(
            children: [
              Expanded(
                flex: 11,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                         horizontal: width * 0.1),
                      child: Image(
                          height: height * 0.3,
                          width: width * 0.40,
                          image: NetworkImage(
                              ApiMovieManager.apiMovieTMDBImageUrl +
                                  listViewModel.categoryListRepo.results[index]
                                      .posterPath!)),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: height * .01, left: width * .04),
                      child: IconButton(icon: Icon(Icons.bookmark_add_outlined,
                        size: 30,color: AppColor.yellowColor,)
                        ,
                         onPressed: () {

                        CollectionReference movie = FirebaseFirestore.instance.collection("Watch List");
                        movie.doc(listViewModel
                            .categoryListRepo.results[index].title).set(listViewModel
                            .categoryListRepo.results[index].toJson());
                       },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetails.routeName,
                        arguments:
                        MovieDetailsArg(
                          title: listViewModel
                              .categoryListRepo.results[index].title,
                          backdropPath: listViewModel
                              .categoryListRepo.results[index].backdropPath,
                          originalLanguage: listViewModel
                              .categoryListRepo.results[index].originalLanguage,
                          originalTitle: listViewModel
                              .categoryListRepo.results[index].originalTitle,
                          overview: listViewModel
                              .categoryListRepo.results[index].overview,
                          posterPath: listViewModel
                              .categoryListRepo.results[index].posterPath,
                          releaseDate: listViewModel
                              .categoryListRepo.results[index].releaseDate,
                          voteAverage: listViewModel
                              .categoryListRepo.results[index].voteAverage,
                          voteCount: listViewModel
                              .categoryListRepo.results[index].voteCount,
                        ));
                  },
                  child: Text(
                    listViewModel.categoryListRepo.results[index].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ]);
      },
    );
  }
}
