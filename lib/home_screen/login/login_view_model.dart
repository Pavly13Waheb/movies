import 'package:flutter/material.dart';

import '../home_page.dart';

class LoginViewModel{
  checkUserNameValidate({String? userName, context}) {
    if (userName == null) {
      return checkUserNameValidate();
    } else {
      //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }
}