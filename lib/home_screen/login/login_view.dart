import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/home_screen/login/login_view_model.dart';
import 'package:movies/provider/provider.dart';
import 'package:movies/theme/app_material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

// ignore: use_key_in_widget_constructors
class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.login,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.logo), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.whiteColor,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red, width: width * .007),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                hintText: AppLocalizations.of(context)!.userName,
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: width * .007, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) {
                AppProvider.userNameLogin =
                    newValue!.trim().split("\n").toString();
              },
              onChanged: (value) {
                AppProvider.userNameLogin = value.trim();
              },
              validator: (value) {
                if (value!.length > 100) {
                  return AppLocalizations.of(context)!
                      .usernameCanotBeMoreThanLetters;
                }
                if (value.length < 5) {
                  return AppLocalizations.of(context)!
                      .usernameCanotBeLessThanLetters;
                }
                return null;
              },
            ),
            SizedBox(height: height * .03),
            InkWell(
              onTap: () {
                loginViewModel.checkUserNameValidate(
                    userName: AppProvider.userNameLogin!
                        .trim()
                        .split("\n")
                        .toString(),
                    context: context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.login,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            SizedBox(height: height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundCheckBox(
                  size: 30,
                  checkedColor: AppColor.yellowColor,
                  uncheckedColor: AppColor.whiteColor,
                  isChecked: false,
                  onTap: (selected) {
                    isChecked = selected!;
                    if (selected == true) {
                      if (AppProvider.userNameLogin == null ||
                          AppProvider.userNameLogin == "" ||
                          AppProvider.userNameLogin!.length < 5) {
                        selected = false;

                        print("is empty");
                      } else {
                        selected = true;
                        AppProvider.currentUser = AppProvider.userNameLogin;
                        AppProvider().keepMeLogin(AppProvider.userNameLogin!);
                        print(
                            "change $isChecked , ${AppProvider.userNameLogin} , ${AppProvider.currentUser} =====");
                      }
                    } else {
                      AppProvider.userNameLogin = "";
                      print("================NULL======================");
                    }
                  },
                ),
                const SizedBox(
                  width: Checkbox.width * .7,
                ),
                Text(
                  "Keep Me Login",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
