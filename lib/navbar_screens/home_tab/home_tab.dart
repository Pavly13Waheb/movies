import 'package:flutter/material.dart';
import 'package:movies/API/api_statics_data.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.03),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return popularMovieView(index);
        },
      ),
    );
  }

  Widget popularMovieView(int index) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade800,
          height: MediaQuery.of(context).size.height * 0.3,
          alignment: Alignment.center,
          child: FutureBuilder(
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
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.08),
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(
                              ApiStaticsManager.apiMovieTmdbImageUrl +
                                  snapshot.data!.results![index].backdropPath!),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child:

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image(
                              image: NetworkImage(ApiStaticsManager
                                      .apiMovieTmdbImageUrl +
                                  snapshot.data!.results![index].posterPath!),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.02,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      //Navigator.pushNamed(context, routeName)
                                    },

                                    child: Text(
                                      snapshot.data!.results![index].title
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  Text(
                                    "releaseDate : ${snapshot.data!.results![index].releaseDate.toString()}   "
                                    "voteAverage : ${snapshot.data!.results![index].voteAverage.toString()}   "
                                    "voteCount : ${snapshot.data!.results![index].voteCount.toString()}   ",
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }




}
