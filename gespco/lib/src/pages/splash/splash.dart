import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gespco/src/services/routes/serviceRoute.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:logger/logger.dart';

final auth = AuthController();

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 550), () {
      onGenerateAppViews(auth, context);
    });

    return const Scaffold(
      backgroundColor: ThemeColors.background,
      body: Stack(
        children: [
          Center(widthFactor: 60, child: Text("Bienvenido a GESPCo.")),
          // TODO: Añadir logo
        ],
      ),
    );
  }
}
