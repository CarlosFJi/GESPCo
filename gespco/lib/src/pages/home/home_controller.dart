import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';

class HomeController {
  var currentPage = 0;
  final loginController = LoginController();
  void setPage(int index) {
    currentPage = index;
  }

  void sigOut(BuildContext context) {
    loginController.signOut(context);
  }
}
