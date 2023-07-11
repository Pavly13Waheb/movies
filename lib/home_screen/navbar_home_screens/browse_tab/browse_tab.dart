import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movie_list/category_movies_list.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movie_list/category_movies_list_args.dart';
import 'package:movies/theme/app_material.dart';
import 'package:provider/provider.dart';
import '../../../repo/movie_category_repo.dart';

class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  MovieCategoryRepo browseTab = MovieCategoryRepo();

  @override
  void initState() {
    browseTab.getGenres();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => browseTab,
      builder: (context, child) {
        browseTab = Provider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.browse),
            centerTitle: true,
          ),
          body: checkCategoryList(),
        );
      },
    );
  }

  checkCategoryList() {
    if (browseTab.genres.isNotEmpty) {
      return categoryModel();
    } else if (browseTab.genres.isEmpty) {
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

  Widget categoryModel() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, CategoryMoviesList.routeName,
                  arguments: CategoryMoviesListArgs(
                      id: browseTab.genres[index].id!,
                      name: browseTab.genres[index].name!));
            },
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
