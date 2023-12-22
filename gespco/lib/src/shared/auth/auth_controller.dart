import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    saveUser(user!);
    _user = user;
    Navigator.pushReplacementNamed(context, "/home", arguments: user);
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      Future.delayed(const Duration(seconds: 2));
      await Navigator.pushReplacementNamed(context, "/login");
    }
  }

  UserModel? existUser() {
    return _user;
  }
}
