import 'package:flutter/material.dart';
import 'package:movies/API/api_popular_class_data.dart';
import 'package:movies/API/api_statics_data.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return popularMovieView();
  }

  popularMovieView() {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade800,
          height: 200,
          alignment: Alignment.topCenter,
          child: FutureBuilder(
            future: ApiStaticsManager.getPopularData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("ERROR");
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image(
                              image: NetworkImage(
                                  ApiStaticsManager.apiMovieTmdbImageUrl +
                                      snapshot.data!.results![2].posterPath!),
                              height: 100,
                              width: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    snapshot.data!.results![2].title.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }

              ;
            },
          ),
        ),
      ],
    );
  }
}
