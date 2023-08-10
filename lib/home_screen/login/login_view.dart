import 'package:flutter/material.dart';
import 'package:movies/home_screen/login/login_view_model.dart';
import 'package:movies/theme/app_material.dart';

class LoginView extends StatefulWidget {
  String? userNameLogin;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = LoginViewModel();

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
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.whiteColor,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red, width: width * .007),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                hintText: "User Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: width * .007, color: Colors.blue),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) {
                widget.userNameLogin = newValue!;
              },
              onChanged: (value) {
                widget.userNameLogin = value;
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
                    userName: widget.userNameLogin, context: context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
