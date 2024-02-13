import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketListController {
  final ticketNotifier = ValueNotifier<List<TicketModel>>(<TicketModel>[]);
  List<TicketModel> get ticket => ticketNotifier.value;
  set tickets(List<TicketModel> value) => ticketNotifier.value = value;
  // test:
  final newTicket = TicketModel();

  addTicket() {
    final newTicket = TicketModel(
        assignedEvent: "eventAssigned",
        barcode: "14324234",
        dueDate: "24/02/2024",
        id: "001",
        name: "cabesa",
        status: "open",
        value: 0.10);

    return [newTicket];
  }

  TicketListController() {
    getTickets();
  }
  void getTickets() async {
    // TODO: Create getTickets
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("tickets");
      if (response != null) {
        tickets = response.map((e) => TicketModel.fromJson(e)).toList();
      } else {
        tickets = addTicket();
      }
    } catch (e) {
      if (kDebugMode) print("Error getTickets: $e");
    }
  }

  void dispose() {
    ticketNotifier.dispose();
  }
}
