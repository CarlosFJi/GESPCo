import 'package:flutter/material.dart';
import 'package:gespco/src/pages/event_list/events_controller.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';

class EventInfoWidget extends StatefulWidget {
  const EventInfoWidget({Key? key}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<EventInfoWidget> {
  final controller = ControllerEvents();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            color: ThemeColors.secondary,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 1,
                height: 32,
                color: ThemeColors.background,
              ),
              ValueListenableBuilder<List<DataEvent>>(
                  valueListenable: controller.eventNotifier,
                  builder: (_, event, __) => event.isNotEmpty
                      ? Text.rich(TextSpan(
                          text: "Hay ",
                          style: FontStyles.captionBackground,
                          children: [
                            TextSpan(
                              text: "${event.length} eventos en tu zona. \n",
                              style: FontStyles.captionBoldBackground,
                            )
                          ],
                        ))
                      : Text.rich(TextSpan(
                          text: "Sin eventos.",
                          style: FontStyles.captionBackground,
                        )))
            ],
          ),
        ),
      ),
    );
  }
}
