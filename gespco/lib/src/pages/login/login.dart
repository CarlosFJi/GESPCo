import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/buttons/social_btn/social_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: ThemeColors.primary,
            ),
            /* TODO: Include logo
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Image.asset(

                  AppImages.person,
                  width: 208,
                  height: 300,
                  
                )),
                */
            Positioned(
                top: size.height * 0.1,
                left: 0,
                right: 0,
                child: const SizedBox(
                    width: 120,
                    height: 150,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("GESPCo"),
                    ))),
            Positioned(
                top: size.height * 0.30,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.4, left: 70, right: 70),
                        child: Text(
                          "Gestor de Espectáculos y Carrera oficial",
                          textAlign: TextAlign.center,
                          style: FontStyles.titleListTile,
                        ),
                      ),
                      // Image.asset(AppImages.logomini),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 130, left: 0, right: 0),
                          child: SocialButton(
                            onTap: () {
                              controller.signIn(context);
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 0),
                          child: MaterialButton(
                            child: const Text("Regístrate aquí"),
                            onPressed: () =>
                                Navigator.pushNamed(context, "/register"),
                          ))
                    ])),
          ])),
    );
  }
}
