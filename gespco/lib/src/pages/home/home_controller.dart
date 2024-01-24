import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';

class HomeController {
  var currentPage = 0;
  final loginController = LoginController();

  void setPage(int index) {
    currentPage = index;
  }

  void checkUser(context) {
    loginController.checkUser(context);
  }

  // TODO: Manegement role
  void checkRole(id) {
    loginController.checkManagement(id);
  }

  void signOut(BuildContext context) {
    loginController.signOut(context);
  }
}
