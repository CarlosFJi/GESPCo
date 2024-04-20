import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get imageDefault => dotenv.env['IMAGE_PROFILE_DEFAULT'] ?? "";
  static String get fileName => kReleaseMode ? "/.env" : ".env";
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
  static String get adminUser => dotenv.env['ADMIN_USERS'] ?? 'MY_FALLBACK';
  static String get moderators =>
      dotenv.env['MODERATOR_USERS'] ?? 'MY_FALLBACK';
  static String get project => dotenv.env["PROJECT_ID"] ?? 'MY_FALLBACK';
  static String get googleClient =>
      dotenv.env['GOOGLE_CLIENT_ID'] ?? 'MY_FALLBACK';
  static String get pubsubClient =>
      dotenv.env['GOOGLE_APPLICATION_CREDENTIALS'] ?? 'MY_FALLBACK';

  Future<void> load() async {
    await dotenv.load(fileName: fileName);
    if (kDebugMode) print("Archivo env cargado: $fileName");
  }
}
