import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketListController {
  final ticketNotifier = ValueNotifier<List<TicketModel>>(<TicketModel>[]);
  List<TicketModel> get ticket => ticketNotifier.value;
  set tickets(List<TicketModel> value) => ticketNotifier.value = value;

  TicketListController() {
    getTickets();
  }
  void getTickets() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("tickets");
      tickets = response!.map((e) => TicketModel.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) print("Error getTickets: $e");
    }
  }

  void dispose() {
    ticketNotifier.dispose();
  }
}
