import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gespco/src/pages/home/home.dart';
import 'package:gespco/src/pages/login/login.dart';
import 'package:gespco/src/pages/register/register.dart';
import 'package:gespco/src/pages/splash/splash.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';

class App extends StatelessWidget {
  App({super.key}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: ThemeColors.background));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GESPCo',
      theme: ThemeData(
          primarySwatch: Colors.indigo, primaryColor: ThemeColors.primary),
      initialRoute: "/splash",
      home: const SplashPage(),
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const Register(),
        "/home": (context) => MyHomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        /*


        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/crear_eventos": (context) => InsertTicketPage(
            barcode: ModalRoute.of(context) != null
                ? ModalRoute.of(context)!.settings.arguments.toString()
                : null),
        "/barcode_scanner": (context) => BarcodeScannerPage()
        */
      },
    );
  }
}

class AppColors {}
