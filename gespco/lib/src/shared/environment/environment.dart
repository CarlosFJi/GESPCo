import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get imageDefault => dotenv.env['IMAGE_PROFILE_DEFAULT'] ?? "";
  static String get fileName => kReleaseMode ? ".env.production" : ".env.dev";
  static String get apiUrl => dotenv.env['API_URL'] ?? 'MY_FALLBACK';
  static String get adminUser => dotenv.env['ADMIN_USERS'] ?? '';

  Future<void> load() async {
    await dotenv.load(fileName: fileName);
    if (kDebugMode) print("Archivo env cargado: $fileName");
  }
}
