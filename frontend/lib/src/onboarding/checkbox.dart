import 'package:flutter/material.dart';

class StatefulCheckbox extends StatefulWidget {
  @override
  _StatefulCheckboxState createState() => _StatefulCheckboxState();
}

class _StatefulCheckboxState extends State<StatefulCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (bool? value) {
        // Update the state to toggle checkbox
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
