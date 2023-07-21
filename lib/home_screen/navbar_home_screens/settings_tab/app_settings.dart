import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';
import '../../../theme/app_material.dart';

class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of(context);

    return ChangeNotifierProvider(
      create: (context) => provider,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.setting),
          ),
          body: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.16,
                left: 5,
                right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.settings, size: 50, color: AppColor.greyColor),
                Text(
                    textAlign: TextAlign.start,
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  height: 40,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15, vertical: 5),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: AppColor.greyColor)),
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
                            provider.changeLanguage("en");
                            provider.currentLocale = "en";
                            provider.notifyListeners();
                          },
                        ),
                        DropdownMenuItem(
                          value: "ar",
                          child: Text("العربية",
                              style: Theme.of(context).textTheme.bodySmall),
                          onTap: () async {
                            provider.changeLanguage("ar");
                            provider.currentLocale = "ar";
                            provider.notifyListeners();
                          },
                        ),
                      ],
                      onChanged: (value) {},
                      value: provider.currentLocale,
                    ),
                  ),
                ),
                Text(
                    textAlign: TextAlign.start,
                    AppLocalizations.of(context)!.mod,
                    style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  height: 40,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15, vertical: 5),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: AppColor.greyColor)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      elevation: 0,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text(AppLocalizations.of(context)!.dark,
                              style: Theme.of(context).textTheme.bodySmall),
                          onTap: () {
                            provider.changeTheme(ThemeMode.dark);
                            provider.currentTheme = ThemeMode.dark;
                            provider.notifyListeners();
                          },
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text(AppLocalizations.of(context)!.light,
                              style: Theme.of(context).textTheme.bodySmall),
                          onTap: () {
                            provider.changeTheme(ThemeMode.light);
                            provider.currentTheme = ThemeMode.light;
                            provider.notifyListeners();
                          },
                        ),
                      ],
                      onChanged: (value) {},
                      value: provider.currentTheme,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
