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

  String checkRole(id) {
    return loginController.checkManagement(id);
  }

  // TODO: Route file
  String navigationRight(id) {
    final role = checkRole(id);
    switch (role) {
      case "admin":
        return "/eventos";
      case "moderator":
        return "/tickets";
      case "client":
        return "/tickets";
    }
    return "";
  }

  String navigationCenter(id) {
    final role = checkRole(id);
    switch (role) {
      case "admin":
        return "/crear_eventos";
      case "moderator":
        return "/barcode_scanner";
      case "client":
        return "/eventos";
    }
    return "";
  }

  Future<void> signOut(BuildContext context) async {
    await loginController.signOut(context);
  }
}
