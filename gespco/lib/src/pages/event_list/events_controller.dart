import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gespco/src/services/readJson/readJson.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:flutter/services.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerEvents {
  final eventNotifier = ValueNotifier<List<DataEvent>>(<DataEvent>[]);
  List<DataEvent> get event => eventNotifier.value;
  set events(List<DataEvent> value) => eventNotifier.value = value;
  final readJson = readingJson();
  final env = Environment;

  ControllerEvents() {
    getEvents();
  }

  List<DataEvent> addEvent() {
    return [
      DataEvent(
          title: "Evento1",
          id: "000",
          description: "Sevilla acoge este nuevo evento...",
          date: "10/04/2024",
          cost: "10"),
      DataEvent(
          title: "Evento2",
          id: "001",
          description: "Cádiz acoge este nuevo evento...",
          date: "30/06/2024",
          cost: "15"),
      DataEvent(
          title: "Evento3",
          id: "002",
          description:
              "Tenemos el placer de presentarle un gran espéctaculo en A Coruña",
          date: "20/09/2024",
          cost: "75"),
    ];
  }

  void getEvents() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("eventos");
      if (response != null) {
        events =
            response.map((e) => DataEvent.fromJson(jsonDecode(e))).toList();
      } else {
        instance.clear();
        events = addEvent();
      }
    } catch (e) {
      if (kDebugMode) print("Error getEvents: $e");
    }
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    final list = json.decode(jsonString);
    return list;
  }

  // Read files Json
  Future<Map<String, dynamic>> readEventsJson() async {
    Map<String, dynamic> jsonData =
        await loadJsonFromAssets('lib/assets/datasetAgenda.json');
    return jsonData;
  }

  Future<Map<String, dynamic>> readEvents() async {
    readJson.readCounter();
    return await readEventsJson();
  }

  Future<Map<String, dynamic>> readAccountJson() async {
    final envPub = Environment.pubsubClient;
    Map<String, dynamic> jsonData = await loadJsonFromAssets(envPub);
    return jsonData;
  }

  void dispose() {
    eventNotifier.dispose();
  }
}
