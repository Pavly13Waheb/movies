import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movies_list_view/category_movies_list.dart';
import 'package:movies/provider/provider.dart';
import 'package:movies/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen/home_page.dart';
import 'home_screen/model/movie_details/movie_details.dart';
import 'home_screen/navbar_home_screens/home_tab/popular_movie_details/popular_movie_details.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniSharedPref();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return MaterialApp(
      themeMode: provider.currentTheme,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        PopularMovieDetails.routeName: (_) => PopularMovieDetails(),
        CategoryMoviesList.routeName: (_) => CategoryMoviesList(),
        MovieDetails.routeName: (_) => MovieDetails(),
      },
      initialRoute: HomePage.routeName,
    );
  }

  iniSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    String theme = prefs.getString("theme") ?? "light";

    provider.changeLanguage(lang);
    provider.changeTheme(theme == "light" ? ThemeMode.light : ThemeMode.dark);
  }
}
