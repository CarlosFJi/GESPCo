import 'dart:convert';
import 'dart:io';

import 'package:gespco/src/services/readJson/readJson.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ControllerEvents {
  //final readingJSON = readingJson();

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    final list = json.decode(jsonString);
    return list;
  }

  Future<Map<String, dynamic>> readEventsJson() async {
    Map<String, dynamic> jsonData =
        await loadJsonFromAssets('lib/assets/datasetAgenda.json');
    return jsonData;
  }
}
