import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:gespco/src/shared/widgets/buttons/rounded_btn/rounded_button.dart';

class AnimatedDatePickerPopup extends StatefulWidget {
  @override
  _AnimatedDatePickerPopupState createState() =>
      _AnimatedDatePickerPopupState();
}

class _AnimatedDatePickerPopupState extends State<AnimatedDatePickerPopup> {
  DateTime selectedDate = DateTime.now();

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      maxDateTime: DateTime.now(),
      initialDateTime: selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RoundedButton(
          colour: Colors.blueAccent,
          title: 'Modifica la fecha de nacimiento.',
          onPressed: () async {
            setState(() {
              _showDatePicker();
            });
          },
        ),
        GestureDetector(
          onTap: () {
            _showDatePicker();
          },
          child: Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
