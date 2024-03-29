import 'package:flutter/material.dart';

import '../home_page.dart';

class LoginViewModel {
  checkUserNameValidate({String? userName, context}) {
    if (userName == null || userName == "") {
      return checkUserNameValidate();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
}
