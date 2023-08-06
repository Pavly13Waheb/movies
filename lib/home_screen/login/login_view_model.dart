import 'package:flutter/cupertino.dart';
import '../home_page.dart';

class LoginViewModel{
  checkUserNameValidate({String? userName, context}) {
    if (userName == "") {
      return checkUserNameValidate();
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }
}