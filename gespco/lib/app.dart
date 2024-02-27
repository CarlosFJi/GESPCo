import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gespco/src/pages/barcode_scanner/barcode_scanner.dart';
import 'package:gespco/src/pages/crear_eventos/crear_eventos.dart';
import 'package:gespco/src/pages/event_list/events.dart';
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
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const Register(),
        "/home": (context) => MyHomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel?,
            ),
        "/barcode_scanner": (context) => const BarcodeScanner(),
        "/eventos:": (context) => const EventPage(),
        "/crear_eventos": (context) => const CrearEventos(),
      },
    );
  }
}
