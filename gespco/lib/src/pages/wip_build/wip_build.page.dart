import 'package:flutter/material.dart';
import 'package:gespco/src/pages/login/login_controller.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/buttons/social_btn/social_btn.dart';

class WIPage extends StatefulWidget {
  const WIPage({Key? key}) : super(key: key);

  @override
  _WIPage createState() => _WIPage();
}

final controller = LoginController();
final auth = AuthController();

class _WIPage extends State<WIPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(children: [
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
                          "Esta pagina está en construcción",
                          textAlign: TextAlign.center,
                          style: FontStyles.titleListTile,
                        ),
                      ),
                    ]))
          ])),
    );
  }
}
