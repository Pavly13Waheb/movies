import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/search_tab/search_delegate/search_delegate.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: [
        Container(
          margin: EdgeInsets.all(5),
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: 50,
            ),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearch());
              setState(() {});
            },
          ),
        )
      ],
    ),
        body: Container(
             ));
  }
}
