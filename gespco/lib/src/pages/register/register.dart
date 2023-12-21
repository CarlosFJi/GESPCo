import 'package:flutter/material.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gespco/src/shared/widgets/rounded_btn/rounded_button.dart';

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
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  final controller = AuthController();

  late String email;
  late String password;

  Future<void> registerUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Future.delayed(Duration(seconds: 1));
      print("Nuevo Usuario: $newUser");
      print("Imagen: ${dotenv.get('IMAGE_PROFILE_DEFAULT')}");
      final userCheck = UserModel(
          name: email,
          photoURL: "${dotenv.get('IMAGE_PROFILE_DEFAULT')}",
          role: "user");

      controller.setUser(context, userCheck);
      // TODO: Register user on ddbb
      print("REGISTER $userCheck");
      Navigator.pushReplacementNamed(context, '/home', arguments: userCheck);
    } catch (e) {
      print(e);
    }
    setState(() {
      showSpinner = false;
    });
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
              child: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(true)),
        ),
        ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email')),
                SizedBox(
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
                        hintText: 'Enter your Password')),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
