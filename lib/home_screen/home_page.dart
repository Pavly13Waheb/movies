import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/theme/app_material.dart';

import 'navbar_home_screens/browse_tab/browse_tab.dart';
import 'navbar_home_screens/home_tab/home_tab.dart';
import 'navbar_home_screens/search_tab/search_tab.dart';
import 'navbar_home_screens/settings_tab/app_settings.dart';
import 'navbar_home_screens/watch_list_tab/watch_list_tab.dart';

class HomePage extends StatefulWidget {
  static String routeName = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List navbar = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
    AppSettings()
  ];
  int navBarPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navbar[navBarPage],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
            backgroundColor: AppColor.navBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: AppLocalizations.of(context)!.search,
            backgroundColor: AppColor.navBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: AppLocalizations.of(context)!.browse,
            backgroundColor: AppColor.navBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: AppLocalizations.of(context)!.watchlist,
            backgroundColor: AppColor.navBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            label: AppLocalizations.of(context)!.setting,
            backgroundColor: AppColor.navBarColor,
          ),
        ],
        currentIndex: navBarPage,
        onTap: (int index) {
          navBarPage = index;
          setState(() {});
        },
      ),
    );
  }
}
