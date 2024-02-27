import 'package:flutter/foundation.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketListController {
  final ticketNotifier = ValueNotifier<List<TicketModel>>(<TicketModel>[]);
  List<TicketModel> get ticket => ticketNotifier.value;
  set tickets(List<TicketModel> value) => ticketNotifier.value = value;
  // test:
  final newTicket = TicketModel();

  addTicket() {
    return [
      TicketModel(
          assignedEvent: "003",
          barcode: "14324234",
          dueDate: "24/04/2024",
          id: "001",
          name: "Evento 3",
          status: "open",
          value: 100),
      TicketModel(
          assignedEvent: "103",
          barcode: "14324234",
          dueDate: "10/04/2024",
          id: "001",
          name: "Evento 0",
          status: "open",
          value: 80)
    ];
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
