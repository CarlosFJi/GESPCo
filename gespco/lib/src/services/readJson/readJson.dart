import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class readingJson {
  var fileToRead = "";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/datasetAgenda.json');
  }

  Future<File> get _accountFile async {
    final path = await _localPath;
    return File('$path/pubsub-services.json');
  }

  Future<int> readAccount() async {
    try {
      final file = await _accountFile;

      // Read the file
      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }
}
