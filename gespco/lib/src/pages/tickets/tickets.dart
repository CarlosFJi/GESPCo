import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/ticket/ticketInfo.dart';
import 'package:gespco/src/shared/widgets/ticket/ticketList.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: ThemeColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: TicketInfoWidget(
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Mis tickets", style: FontStyles.titleBoldHeading),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: ThemeColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TicketList(
              key: UniqueKey(),
            ),
          )
        ],
      ),
    );
  }
}
