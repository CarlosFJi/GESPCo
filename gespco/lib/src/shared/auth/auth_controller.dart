import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:gespco/src/shared/classes/dataUser.dart";
import "package:shared_preferences/shared_preferences.dart";

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

  Future<void> recoveryUser(context, instance) async {
    final json = instance.get("user") as String;
    if (context.mounted) setUser(context, UserModel.fromJson(json));
    if (kDebugMode) print("User logged: $json");
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user") && context.mounted) {
      recoveryUser(context, instance);
      return;
    } else if (existUser() == null) {
      if (context.mounted) Navigator.pushReplacementNamed(context, "/login");
    }
  }

  UserModel? existUser() {
    return _user;
  }

  void signOut(context) async {
    final instance = await SharedPreferences.getInstance();
    instance.clear();
    try {
      _user = null;
      Navigator.pushReplacementNamed(context, "/splash");
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
