import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/signIn/signIn.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginController {
  final authController = AuthController();
  final googleSignin = const GoogleSignInScreen();

  String checkManagement(id) {
    final management = dotenv.env["ADMIN_USERS"];
    const controller = String.fromEnvironment("ADMIN_USERS");
    if (kDebugMode)
      print("ESTO ES MODERADOR: $controller \n ESTO ES MANAGER: $management");
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
