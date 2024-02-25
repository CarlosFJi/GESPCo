import 'package:flutter/material.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/themes/font_style.dart';

class EventTile extends StatelessWidget {
  final DataEvent data;
  const EventTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.title,
          style: FontStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence en: ${data.description}",
          style: FontStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: "€",
          style: FontStyles.trailingRegular,
          children: [
            TextSpan(
              text: data.description,
              style: FontStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
