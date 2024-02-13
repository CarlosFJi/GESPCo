import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gespco/src/services/readJson/readJson.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerEvents {
  //final readingJSON = readingJson();
  final eventNotifier = ValueNotifier<List<DataEvent>>(<DataEvent>[]);
  List<DataEvent> get events => eventNotifier.value;
  set events(List<DataEvent> value) => eventNotifier.value = value;

  // test
  //final newEvent = DataEvent(context: "");

  EventListController() {
    getEvents();
  }

  void getEvents() async {
    // TODO: Create getTickets
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("eventos");
      if (response != null) {
        events =
            response.map((e) => DataEvent.fromJson(jsonDecode(e))).toList();
      } else {
        // events = addTicket();
      }
    } catch (e) {
      if (kDebugMode) print("Error getTickets: $e");
    }
  }

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

  void dispose() {
    eventNotifier.dispose();
  }
}
