import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gespco/firebase_options.dart';
import 'package:gespco/app.dart';
// import 'package:gespco/src/services/db/db_manage.dart';
import 'package:gespco/src/shared/environment/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment().load();
  // DBManage().initizateDb();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}
