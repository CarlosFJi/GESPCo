// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/services/routes/serviceRoute.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gespco/src/shared/classes/RoleType.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:gespco/src/shared/widgets/buttons/rounded_btn/rounded_button.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final controller = AuthController();

  late String email;
  late String password;

  // verify entryCode
  // verifyDataset()

  void registerUser(context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final defaultImage = Environment.imageDefault;
      if (kDebugMode) {
        print("Nuevo Usuario: $newUser");
        // print("Imagen: ${defaultImage}");
      }

      final userCheck = UserModel(
          name: email.split("@")[0],
          photoURL: defaultImage,
          role: RoleType.CLIENT);
      // TODO: Register user on ddbb
      controller.setUser(context, userCheck);
      if (kDebugMode) print("REGISTER $userCheck");
    } catch (e) {
      print("ERROR $e");
      showDialog(
        //in the case that an error occurs, by us putting the return in front of showDialog, showDialog will fulfill that Future in case of the error. If there is no error the .then will fulfill the expected Future value
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occurred'),
          content: Text("$e"),
          //we will change the value of message to display according to what the API call returns
          actions: [
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.pop(context);
                showSpinner = false;
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      );
    }
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
              child: const Icon(Icons.arrow_back),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login')),
        ),
        ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //TODO: Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Introduce el correo:')),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (_) {
                      password = _;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Introduce una contraseña:')),
                RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Registrate',
                  onPressed: () {
                    setState(() {
                      // TODO: Register user
                      showSpinner = true;
                    });
                    registerUser(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
