import 'package:flutter/material.dart';
import 'package:movies/home_screen/navbar_home_screens/search_tab/search_delegate/search_delegate.dart';
import 'package:movies/theme/app_material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
}
