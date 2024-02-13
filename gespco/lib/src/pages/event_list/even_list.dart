import 'package:flutter/material.dart';
import 'package:gespco/src/pages/event_list/event_tile.dart';
import 'package:gespco/src/pages/event_list/events_controller.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventList> {
  final controller = ControllerEvents();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<DataEvent>>(
        valueListenable: controller.eventNotifier,
        builder: (_, tickets, __) => Column(
            children: tickets
                .map(
                  (e) => EventTile(data: e),
                )
                .toList()));
  }
}
