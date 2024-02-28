import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

final auth = AuthController();
final log = Logger();
final date = DateTime.now();
final management = Environment.adminUser;
final moderator = Environment.moderators;
const googleSignin = GoogleSignInScreen();

class LoginController {
  String checkManagement(id) {
    List<dynamic> listModerator = jsonDecode(moderator!);

    if (id != null && management != null) {
      if (management == id) {
        return "admin";
      }
      final exist = listModerator.where((element) => element == id);
      return exist.isNotEmpty ? "moderator" : "client";
    }
    return "client";
  }

  void checkUser(context) async {
    Navigator.popAndPushNamed(context, "/splash");
  }

  Future<void> signIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final response = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await response!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    if (context.mounted) auth.loginUser(context, credential);
    log.i("Inicio sesión $date, ${auth.user.id}");

    checkManagement(auth.user.id);
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    log.i("Cierre sesión: $date, ${auth.user.id}");
    if (context.mounted) auth.signOut(context);
  }
}
