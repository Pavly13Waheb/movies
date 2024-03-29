import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_statics_data.dart';
import 'package:movies/theme/app_material.dart';

import '../../../../API/model_movies_api/search_data_model.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            color: AppColor.yellowColor,
            size: 30,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.clear,
          color: AppColor.yellowColor,
          size: 30,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ifQueryIsNull(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ifQueryIsNull(context);
  }

  Widget ifQueryIsNull(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (query == "") {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CircularProgressIndicator()),
            SizedBox(height: height * 0.05),
            Text(
              "Please type what you are searching for",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      );
    } else {
      return FutureBuilder<SearchDM>(
          future: ApiMovieManager.searchDelegate(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: width * 0.08,
                    mainAxisSpacing: height * 0.02),
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future:
                        ApiMovieManager.searchDelegate(searchKeyWord: query),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "ERROR",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Expanded(
                              flex: 11,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                child: Image(
                                    height: height * 0.2,
                                    width: width * 0.37,
                                    image: NetworkImage(
                                        ApiMovieManager.apiMovieTMDBImageUrl +
                                            snapshot.data!.results![index]
                                                .posterPath!)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                snapshot.data!.results![index].title!,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }
}
