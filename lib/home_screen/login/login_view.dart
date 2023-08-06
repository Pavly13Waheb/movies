import 'package:flutter/material.dart';
import 'package:movies/home_screen/login/login_view_model.dart';
import 'package:movies/theme/app_material.dart';

class LoginView extends StatelessWidget {
  LoginViewModel loginViewModel = LoginViewModel();
  static String routeName = "RouteName";
  static String? userName;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
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
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                hintText: "User Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) {
                userName = newValue!;
              },
              onChanged: (value) {
                userName = value;
              },
              validator: (value) {
                if (value!.length > 100) {
                  return "Username can't be more than 100 letter";
                }
                if (value.length < 5) {
                  return "Username can't be less than 5 letter";
                }
                return null;
              },
            ),
            SizedBox(height: height * .03),
            InkWell(
              onTap: () {
                loginViewModel.checkUserNameValidate(
                    userName: userName, context: context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
