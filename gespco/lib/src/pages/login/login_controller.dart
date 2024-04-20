import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

final auth = AuthController();
final log = Logger();
final date = DateTime.now();
const googleSignin = GoogleSignInScreen();

class LoginController {
  void checkUser(context) async {
    final user = await auth.recoveryUser(context);
    if (user != null) {}
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
    final userAuth = auth.user;
    DateTime now = DateTime.now();
    log.i("Inicio sesión $now, ${userAuth.id}");
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    log.i("Cierre sesión: $date, ${auth.user.id}");
  }
}
