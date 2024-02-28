import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/ticket/ticket_controller.dart';

class TicketInfoWidget extends StatefulWidget {
  const TicketInfoWidget({Key? key}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<TicketInfoWidget> {
  final controller = TicketListController();
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
              ValueListenableBuilder<List<TicketModel>>(
                  valueListenable: controller.ticketNotifier,
                  builder: (_, tickets, __) => tickets.isNotEmpty
                      ? Text.rich(TextSpan(
                          text: "Tienes ",
                          style: FontStyles.captionBackground,
                          children: [
                            TextSpan(
                              text: "${tickets.length} tickets \n",
                              style: FontStyles.captionBoldBackground,
                            )
                          ],
                        ))
                      : Text.rich(TextSpan(
                          text: "Parece que no tienes tickets.",
                          style: FontStyles.captionBackground,
                        )))
            ],
          ),
        ),
      ),
    );
  }
}
