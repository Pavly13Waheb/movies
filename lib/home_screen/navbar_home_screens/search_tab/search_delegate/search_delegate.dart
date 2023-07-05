import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';
import 'package:movies/API/search_api_movie/Search_data_model.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ifResultQueryNull(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }


  ifResultQueryNull(BuildContext context) {
    if (query == "") {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Please type what you are searching for",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      );
    } else {
      return FutureBuilder<SearchDM>(
          future: ApiStaticsManager.searchDelegate(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error.toString()}");
              return Text("${snapshot.error.toString()}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return       Column(
                    children: [
                      FutureBuilder(
                        future: ApiStaticsManager.getPopularData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "ERROR",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.01),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: MediaQuery.of(context).size.height * 0.01),
                                    child: Image(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        image: NetworkImage(
                                            ApiStaticsManager.apiMovieTmdbImageUrl +
                                                snapshot.data!.results![index].posterPath!)),
                                  ),
                                  Text(textAlign: TextAlign.center,
                                    snapshot.data!.results![index].title!,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    ],
                  );

                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }



}
