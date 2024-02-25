import "dart:convert";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:gespco/src/services/pubSub/pubSub.dart";
import "package:gespco/src/services/storage/firestore_.dart";
import "package:gespco/src/shared/classes/RoleType.dart";
import "package:gespco/src/shared/classes/dataUser.dart";
import "package:gespco/src/shared/environment/environment.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;
  final _auth = FirebaseAuth.instance;

  final _pbService = const PubSubService();

  void loginUser(context, AuthCredential credens) async {
    final result = (await _auth.signInWithCredential(credens));
    final logged = result.user;
    pathUser(context, logged!.email, result.credential?.providerId, false);
  }

  String buildMeta(String data) {
    final regExpDateTime =
        RegExp(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{3}Z");
    final match = regExpDateTime.firstMatch(data);

    return match!.group(0).toString();
  }

  void pubSubServiceWelcome(UserModel userLogged) async {
    final metadata = buildMeta(userLogged.metadata!);

    final dataBQ = {
      "userId": "${userLogged.id}",
      "nombre": "${userLogged.name}",
      "fecha_registro": "${metadata}",
      "role": RoleType.convertRole(RoleType.CLIENT),
      "ultimo_acceso": "${metadata}"
    };
    // TODO: ENVIRONMENT TOPICS
    final messageId = await _pbService.publish("new_user", jsonEncode(dataBQ));
    print("MessageId Pub/Sub: $messageId");
  }

  Future<UserModel> pathUser(context, email, password, isRegister) async {
    final defaultImage = Environment.imageDefault;
    final isNew = await _auth.fetchSignInMethodsForEmail(email);

    var userFormat = {};
    if (isRegister == true) {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      print("Nuevo acceso: $newUser");

      if (newUser.credential != null) {
        final firebaseUser =
            (await _auth.signInWithCredential(newUser.credential!)).user;
      }
      final userData = newUser.user;
      final imageURL = userData!.photoURL;

      userFormat["id"] = userData.uid;
      userFormat["email"] = email;
      userFormat["name"] = email.split("@")[0];
      userFormat["photoURL"] = imageURL ?? defaultImage;
      userFormat["metadata"] = userData.metadata.toString();
      userFormat["role"] = RoleType.CLIENT;
    } else {
      final currentUser = _auth.currentUser;
      userFormat["id"] = currentUser!.uid;
      userFormat["email"] = currentUser.email;
      userFormat["name"] = currentUser.displayName;
      userFormat["photoURL"] = currentUser.photoURL;
      userFormat["metadata"] = currentUser.metadata.toString();
      //TODO: CHECK ROLES
      userFormat["role"] = RoleType.CLIENT;
    }
    if (userFormat != {}) {
      final userLogged = UserModel(
        id: userFormat["id"],
        email: userFormat["email"],
        name: userFormat["name"],
        photoURL: userFormat["photoURL"],
        metadata: userFormat["metadata"],
        role: userFormat["role"],
      );

      Firestore.newUser(userLogged);
      setUser(context, userLogged);
      if (isRegister == true) pubSubServiceWelcome(userLogged);
      return userLogged;
    }
    return {} as UserModel;
  }

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
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;
    if (context.mounted) setUser(context, UserModel.fromJson(json));
    if (kDebugMode) print("User logged: $json");
    return;
  }

  // Recupera el usuario desde la instancia en memoria
  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final uInstance = instance.get("user");
    if (uInstance == null && context.mounted) {
      await recoveryUser(context, instance);
      return;
    } else {
      if (context.mounted) Navigator.pushReplacementNamed(context, "/splash");
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
