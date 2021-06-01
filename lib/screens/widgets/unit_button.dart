import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/tracers.dart';

class UnitButton extends StatelessWidget {
  final UNITS unitName;
  final Function unitCallBack;

  UnitButton({this.unitName, this.unitCallBack});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        unitCallBack(unitName);
      },
      child: Text(UNITS_NAME[unitName]),
    );
  }
}
