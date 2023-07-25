import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/API/api_statics_data.dart';
import 'package:movies/API/model_movies_api/api_category_movie.dart';
import 'package:movies/repo/movie_category_repo.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  MovieCategoryRepo browstest = MovieCategoryRepo();

  List first = [1, 2, 23, 5, 5, 45, 454, 56, 6, 78, 64, 56, 5];
  List second = [];

  @override
  void initState() {
    // TODO: implement initState
    browstest.getGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Genres> test = browstest.genres;
    return ChangeNotifierProvider(
      create: (context) {
        return browstest;
      },
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(""),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
            ],
          ),
          body: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                        textStyle:
                            MaterialStatePropertyAll(TextStyle(fontSize: 40)),
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text("Put Firebase"),
                    onPressed: () async {
                      ApiMovieManager.getCategory();
                      CollectionReference addListIndex =
                          FirebaseFirestore.instance.collection("List");
                      await addListIndex
                          .doc('dsa')
                          .set({"List": browstest.genres.toString()});
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        textStyle:
                            MaterialStatePropertyAll(TextStyle(fontSize: 40)),
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text("Get FireBase"),
                    onPressed: () async {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: Hive.box('settings').listenable(),
                builder: (context, box, child) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: const ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(fontSize: 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          child: const Text("Put Hive"),
                          onPressed: () {
                            box.put("key", browstest.genres);
                            print(
                                "++++++++++++++Added Hive Key+++++++++++++++++");
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(fontSize: 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          child: const Text("Get Hive"),
                          onPressed: () async {
                            bool result =
                                await InternetConnectionChecker().hasConnection;
                            if (result == true) {
                              print('YAY! Free cute dog pics!');
                              test = browstest.genres;
                              print(test);
                            } else {
                              print('No internet :( Reason:');
                              var getBox = box.get("key");
                              print(
                                  "===================$getBox===============");
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
