import 'package:flutter/material.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/RoleType.dart';

void onGenerateAppViews(AuthController auth, context) {
  final exist = auth.existUser();
  if (exist != null) {
    if (context.mounted && exist as bool) {
      if (auth.user.role == RoleType.ADMIN) {
        print('Hi ADMIN!');
      } else if (auth.user.role == RoleType.MODERATOR) {
        print('Hi Moderator');
      } else {
        print('Hi Client');
      }
      Navigator.pushNamed(context, "/home", arguments: auth.user);
    }
  } else {
    Navigator.pushNamed(context, "/login");
  }
}
