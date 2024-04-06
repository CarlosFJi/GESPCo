import 'package:flutter/material.dart';

import 'package:gespco/src/pages/login/login_controller.dart';
import 'package:gespco/src/pages/wip_build/wip_build.page.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';

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

  void checkUser(context, UserModel? user) async {
    if (user == null) {
      UserModel? user = await auth.recoveryUser(context);
      print("checkUser: $user");
    }
  }

  Future<void> signOut(BuildContext context) async {
    await loginController.signOut(context);
  }
}
