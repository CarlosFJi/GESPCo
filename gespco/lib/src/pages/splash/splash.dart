import 'package:flutter/material.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gespco/src/services/db/db_manage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    Future.delayed(Duration(seconds: 2));

    Future<void> init() async {
      await dotenv.load(fileName: ".env");
      final db = await DBManage.initizateDb();
      print("$db initiliazed");
    }

    init();

    return Scaffold(
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
