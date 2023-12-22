import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();
  final googleSignin = const GoogleSignInScreen();

  String checkManagement(id) {
    final management = Environment.adminUser;

    if (kDebugMode) print("ESTO ES MANAGER: $management");
    return "cabesa";
  }

  Future<void> signIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final response = await _googleSignIn.signIn();
    final user = UserModel(
        name: response!.displayName!, photoURL: response.photoUrl, role: "");
    if (context.mounted) authController.setUser(context, user);
    // print("Loggin user success. ID: $response");
    // TODO: CHECK USER Logger
    // if (response.id) checkManagement();
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
  }
}
