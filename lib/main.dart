import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/home_screen/login/login_view.dart';
import 'package:movies/home_screen/navbar_home_screens/browse_tab/category_movies_list_view/category_movies_list.dart';
import 'package:movies/provider/provider.dart';
import 'package:movies/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'home_screen/home_page.dart';
import 'home_screen/model/movie_details/movie_details.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.disableNetwork();

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
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

    return ChangeNotifierProvider(
      create: (context) => provider,
      builder: (context, child) {
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
            MovieDetails.routeNameMovieDetails: (_) => MovieDetails(),
            HomePage.routeName: (_) => HomePage(),
            CategoryMoviesList.routeName: (_) => CategoryMoviesList(),
            "Login": (_) => LoginView()
          },
          initialRoute: "Login",
        );
      },
    );
  }

  void iniSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    String theme = prefs.getString("theme") ?? "dark";
    String? loginUser = prefs.getString("user");

    provider.changeLanguage(lang);
    provider.changeTheme(theme == "dark" ? ThemeMode.dark : ThemeMode.light);
    provider.keepMeLogin(loginUser!);
  }
}

