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
              "Vence en: ${data.date}",
              style: FontStyles.captionBody,
            ),
            trailing: Text(
              "${data.cost} €",
            ),
            onTap: () => showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                        title:
                            Text(data.title, style: FontStyles.titleListTile),
                        content: Text(data.description!,
                            style: FontStyles.captionBody),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: Navigator.of(context).pop,
                            child: const Text("Close"),
                          ),
                        ]);
                  },
                )));
  }
}
