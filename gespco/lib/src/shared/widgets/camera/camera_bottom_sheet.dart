import 'package:flutter/material.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/buttons/set_labels_btn/set_labels_btn.dart';

class CameraBottomSheet extends StatelessWidget {
  final String labelPrimary;
  final VoidCallback onTapPrimary;
  final String labelSecondary;
  final VoidCallback onTapSecondary;
  final String title;
  final String subtitle;
  const CameraBottomSheet(
      {Key? key,
      required this.labelPrimary,
      required this.onTapPrimary,
      required this.labelSecondary,
      required this.onTapSecondary,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.black.withOpacity(0.5),
            )),
            Container(
              color: ThemeColors.background,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text.rich(
                    TextSpan(
                        text: title,
                        style: FontStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: "\n$subtitle",
                            style: FontStyles.buttonHeading,
                          )
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: ThemeColors.stroke,
                      )),
                    ],
                  ),
                  SetLabelsBtn(
                    enablePrimaryColor: true,
                    labelPrimary: labelPrimary,
                    onTapPrimary: onTapPrimary,
                    labelSecondary: labelSecondary,
                    onTapSecondary: onTapSecondary,
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
