import 'package:flutter/material.dart';
import 'package:gespco/src/shared/themes/font_style.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle style;
  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.style,
  }) : super(key: key);

  factory LabelButton.heading(
          {required String label, required VoidCallback onPressed}) =>
      LabelButton(
        label: label,
        onPressed: onPressed,
        style: FontStyles.buttonHeading,
      );

  factory LabelButton.primary(
          {required String label, required VoidCallback onPressed}) =>
      LabelButton(
        label: label,
        onPressed: onPressed,
        style: FontStyles.buttonPrimary,
      );

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: SizedBox(
        height: 56,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: style,
          ),
        ),
      ))
    ]);
  }
}
