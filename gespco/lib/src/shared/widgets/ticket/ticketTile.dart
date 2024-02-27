import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataTicket.dart';
import 'package:gespco/src/shared/themes/font_style.dart';

class TicketTile extends StatelessWidget {
  final TicketModel data;
  const TicketTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: FontStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence en: ${data.dueDate}",
          style: FontStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: "€",
          style: FontStyles.trailingRegular,
          children: [
            TextSpan(
              text: data.value!.toStringAsFixed(2),
              style: FontStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
