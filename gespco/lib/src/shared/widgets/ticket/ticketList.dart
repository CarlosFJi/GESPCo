import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:gespco/src/shared/widgets/ticket/ticketTile.dart';

import 'package:gespco/src/shared/widgets/ticket/ticket_controller.dart';

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  _TicketListWidgetState createState() => _TicketListWidgetState();
}

class _TicketListWidgetState extends State<TicketList> {
  final controller = TicketListController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TicketModel>>(
        valueListenable: controller.ticketNotifier,
        builder: (_, tickets, __) => Column(
            children: tickets
                .map(
                  (e) => TicketTile(data: e),
                )
                .toList()));
  }
}
