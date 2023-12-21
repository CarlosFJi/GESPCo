import 'package:flutter/material.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/images_routes.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 500,
        decoration: BoxDecoration(
            color: ThemeColors.shape,
            borderRadius: BorderRadius.circular(9),
            border: Border.fromBorderSide(
              BorderSide(
                color: ThemeColors.stroke,
              ),
            )),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(ImagesRoute.google),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: ThemeColors.stroke,
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: Text(
                      "Entrar con Google",
                      style: FontStyles.buttonGray,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
 TODO: renderButton GoogleSignIN

import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;
                   const SizedBox(height: 16),
                  (GoogleSignInPlatform.instance as web.GoogleSignInPlugin)
                      .renderButton(configuration: web.GSIButtonConfiguration())
*/