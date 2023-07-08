import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/search_tab/search_delegate/search_delegate.dart';
import 'package:movies/theme/app_material.dart';
import '../../../API/api_statics_data.dart';
import '../../../API/model_movies_api/search_data_model.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {

    TextEditingController searchKeyword = TextEditingController();

    return



      Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.1,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: InkWell(
        onTap: () {
          showSearch(context: context, delegate: MovieSearch());
          setState(() {});
        },
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                color: AppColor.greyColor,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(
                    Icons.search,
                    color: AppColor.yellowColor,
                  )
                ])),
      ),
    );
  }


  Widget ifQueryIsNull(BuildContext context , String query){
    if (query == "") {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CircularProgressIndicator()),
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
          future: ApiManager.searchDelegate(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.08,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02),
                itemCount: snapshot.data!.results!.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: ApiManager.searchDelegate(searchKeyWord: query),
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
                            Expanded(flex: 11,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                    MediaQuery.of(context).size.height *
                                        0.01),
                                child: Image(
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.37,
                                    image: NetworkImage(ApiManager
                                        .apiMovieTmdbImageUrl +
                                        snapshot.data!.results![index]
                                            .posterPath!)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                snapshot.data!.results![index].title!,
                                style:
                                Theme.of(context).textTheme.labelSmall,
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Center(
                            child: CircularProgressIndicator());
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
