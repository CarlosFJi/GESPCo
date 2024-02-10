import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/storage/firestore.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/RoleType.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // TODO: CHECK USER Logger
    final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl!,
        role: RoleType.CLIENT);

    if (context.mounted) {
      auth.setUser(context, user);
    }

    // print("Loggin user success. ID: $response");

    // if (response.id) checkManagement();
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    if (context.mounted) auth.signOut(context);
  }
}
