import 'package:flutter/material.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/ticket/ticketList.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
