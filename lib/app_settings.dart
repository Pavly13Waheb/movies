import 'package:flutter/material.dart';
import 'package:movies/provider.dart';
import 'package:provider/provider.dart';
import '../theme/app_material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_page.dart';

class AppSettings extends StatefulWidget {
  static String routeName = "appSettings";

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of(context);
    String? language = provider.currentLocale;
    ThemeMode? mod = provider.currentTheme;

    return Scaffold(

      appBar: AppBar(        title: Text(AppLocalizations.of(context)!.setting),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.16, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.settings, size: 50, color: AppColor.grayColor),
            Text(
                textAlign: TextAlign.start,
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium),
            Container(
              height: 40,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.grayColor)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                elevation: 0,
                alignment: Alignment.center,
                items: [
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English",
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () async {
                      provider.currentLocale = "en";
                      provider.notifyListeners();
                    },
                  ),
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("العربية",
                        style: Theme.of(context).textTheme.bodySmall),
                    onTap: () async {
                      provider.currentLocale = "ar";
                      provider.notifyListeners();
                    },
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    language = value;
                  });
                },
                value: language,
              )),
            ),
            Text(
                textAlign: TextAlign.start,
                AppLocalizations.of(context)!.mod,
                style: Theme.of(context).textTheme.bodyMedium),
            Container(
              height: 40,
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: AppColor.grayColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  elevation: 0,
                  alignment: Alignment.center,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context)!.light,
                          style: Theme.of(context).textTheme.bodySmall),
                      onTap: () {
                        provider.currentTheme = ThemeMode.light;
                        provider.notifyListeners();
                      },
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context)!.dark,
                          style: Theme.of(context).textTheme.bodySmall),
                      onTap: () {
                        provider.currentTheme = ThemeMode.dark;
                        provider.notifyListeners();
                      },
                    ),
                  ],
                  onChanged: (value) {
                    setState(
                      () {
                        mod = value;
                      },
                    );
                  },
                  value: mod,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  drawerChild(
      {required IconData icon,
        required String childName,
        required Function() onChildTap}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: InkWell(
              onTap: onChildTap,
              child: Row(
                children: [
                  Icon(icon, size: 30),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      childName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
