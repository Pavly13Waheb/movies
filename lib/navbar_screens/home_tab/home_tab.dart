// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    return FutureBuilder<ApiPopularDM>(
      future: ApiStaticsManager.getPopularData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("ERROR");
        } else if (snapshot.hasData) {
          return Center(
            child: Column(children: [
              Text("API VideO"),
              Row(
                children: [
                  Image(
                      image: AssetImage(snapshot
                          .data!.results![0].posterPath
                          .toString())),
                  Column(
                    children: [
                      Text("API MOVIE NAME"),
                      Expanded(
                        child: Row(
                          children: [
                            Text("MOVIE YEAR"),
                            Text("MOVIE PG ...."),
                            Text("MOVIE TIME")
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
