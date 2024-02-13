import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:google_sign_in/google_sign_in.dart';

final auth = AuthController();

class LoginController {
  final googleSignin = const GoogleSignInScreen();

  String checkManagement(id) {
    final management = Environment.adminUser;

    if (kDebugMode) print("ESTO ES MANAGER: $management");
    return "cabesa";
  }

  void checkUser(context) async {
    Navigator.popAndPushNamed(context, "/splash");
  }

  Future<void> signIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final response = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await response!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    if (context.mounted) auth.loginUser(context, credential);
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    if (context.mounted) auth.signOut(context);
  }
}
