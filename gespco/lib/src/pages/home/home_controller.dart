import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';

import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  var currentPage = 0;
  final loginController = LoginController();
  final auth = AuthController();

  void setPage(int index) {
    currentPage = index;
  }

  UserModel? userRegister() {
    return auth.existUser();
  }

  void checkUser(context) async {
    final instance = await SharedPreferences.getInstance();
    auth.recoveryUser(context, instance);
  }

  // TODO: Manegement role
  void checkRole(id) {
    loginController.checkManagement(id);
  }

  void signOut(BuildContext context) {
    loginController.signOut(context);
  }
}
