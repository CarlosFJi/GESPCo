import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gespco/firebase_options.dart';
import 'package:gespco/app.dart';
import 'package:gespco/src/services/logging/logging.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:logger/logger.dart';

final log = Logger();
final googleCloudLoggingService = GoogleCloudLoggingService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment().load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await googleCloudLoggingService.setupLoggingApi();

  // Use the output listener from the Logger package to write logs to Cloud Logging
  Logger.addOutputListener((event) {
    if (kReleaseMode) {
      // Only write logs to Cloud Logging in release mode
      googleCloudLoggingService.writeLog(
        level: event.level,
        message: event.lines.join(
            '\n'), // Join the log lines with a new line, so that it is written as a single message
      );
    }
  });

  log.i('App started');
  runApp(App());
}
