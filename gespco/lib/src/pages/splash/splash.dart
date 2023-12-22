import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/services/db/db_manage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    Future.delayed(const Duration(seconds: 3));

    Future<void> init() async {
      final db = await DBManage.initizateDb();
      if (kDebugMode) print("$db initiliazed");
    }

    init();

    return const Scaffold(
      backgroundColor: ThemeColors.background,
      body: Stack(
        children: [
          Center(widthFactor: 100, child: Text("Bienvenido a GESPCo.")),
          // TODO: Añadir logo
        ],
      ),
    );
  }
}
