import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/buttons/social_btn/social_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final controller = LoginController();
final auth = AuthController();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    if (auth.existUser() != null) {
      auth.currentUser(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              color: ThemeColors.primary,
            ),
            Positioned(
                top: size.height * 0.02,
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
                top: size.height * 0.20,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 0, left: 70, right: 70),
                        child: Text(
                          "Gestor de Espectáculos y Carrera oficial",
                          textAlign: TextAlign.center,
                          style: FontStyles.titleListTile,
                        ),
                      ),
                      // Image.asset(AppImages.logomini),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 120, left: 0, right: 0),
                          child: SocialButton(
                            onTap: () {
                              controller.signIn(context);
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 0),
                          child: MaterialButton(
                            child: const Text("Regístrate aquí"),
                            onPressed: () =>
                                Navigator.pushNamed(context, "/register"),
                          ))
                    ]))
          ])),
    );
  }
}
