import 'package:flutter/material.dart';
import 'package:movies/repo/movie_category_list_view_model.dart';
import 'package:movies/repo/movie_category_view_model.dart';
import 'package:movies/theme/app_material.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  MovieCategoryViewModel browseTab = MovieCategoryViewModel();
  MovieCategoryListViewModel browsTabList = MovieCategoryListViewModel();

  @override
  void initState() {
    browseTab.getGenres();
    browsTabList.getResults();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return categoryModel(width, height);
  }

  Widget categoryModel(var width, var height) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: browseTab.genres.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          width: width * 0.3,
          height: height * 0.3,
          child: Column(
            children: [
              Image(
                image: AssetImage(AppImage.logo),
                height: height * 0.18,
              ),
              Expanded(
                  child: Text(
                browseTab.genres[index].name!,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
            ],
          ),
        );
      },
    );
  }
}
