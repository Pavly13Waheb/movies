import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movie_list/category_movies_list_args.dart';
import 'package:movies/repo/movie_category_list_repo.dart';
import 'package:provider/provider.dart';

import '../../../../API/api_statics_data.dart';

class CategoryMoviesList extends StatefulWidget {
  static String routeName = "CategoryMoviesList";

  @override
  State<CategoryMoviesList> createState() => _CategoryMoviesListState();
}

class _CategoryMoviesListState extends State<CategoryMoviesList> {
  MovieCategoryListRepo categoryListRepo = MovieCategoryListRepo();

  @override
  void initState() {
    categoryListRepo.getResults();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as CategoryMoviesListArgs;
    num id = arg.id;
    String name = arg.name;

    //List<CategoryResultsDM> categoryMoviesListBuilder=[];

    return ChangeNotifierProvider(
      create: (context) => categoryListRepo,
      builder: (context, child) {
        categoryListRepo = Provider.of(context);
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

  // idLoop(int index, int id,List moviesListBuilder) {
  //   for (int i = 0; i <= categoryListRepo.results.length; i++) {
  //     for(int j = 0 ; j<= categoryListRepo.results[index].genreIds!.length;j++){
  //     if (id == categoryListRepo.results[index].genreIds![index]) {
  //       return
  //         moviesListBuilder.add(categoryListRepo.results[index])
  //        ;
  //     } else {
  //       return idLoop(index, id,moviesListBuilder);
  //     }}
  //   }
  // }

  checkCategoryList() {
    if (categoryListRepo.results.isNotEmpty) {
      return categoryMoviesListModel();
    } else if (categoryListRepo.results.isEmpty) {
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

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: width * 0.08,
          mainAxisSpacing: height * 0.02),
      itemCount: categoryListRepo.results.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              flex: 11,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                child: Image(
                    height: height * 0.2,
                    width: width * 0.37,
                    image: NetworkImage(ApiMovieManager.apiMovieTMDBImageUrl +
                        categoryListRepo.results[index].posterPath!)),
              ),
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                categoryListRepo.results[index].title!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        );
      },
    );
  }
}
