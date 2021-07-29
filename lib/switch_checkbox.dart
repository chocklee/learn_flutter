import 'package:flutter/material.dart';

class SwitchAndCheckBoxRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxRouteState createState() => _SwitchAndCheckBoxRouteState();
}

class _SwitchAndCheckBoxRouteState extends State<SwitchAndCheckBoxRoute> {
  bool _switchSelected = false;
  bool _checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            })
      ],
    );
  }
}
