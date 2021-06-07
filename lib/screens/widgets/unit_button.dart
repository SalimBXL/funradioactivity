import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';

class UnitButton extends StatelessWidget {
  final UNITS unitName;
  final Function unitCallBack;
  final bool selected;

  UnitButton({this.unitName, this.unitCallBack, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: selected
          ? OutlinedButton.styleFrom(
              backgroundColor: COLOR_PRIMARY_B,
              primary: COLOR_PRIMARY_F,
            )
          : OutlinedButton.styleFrom(
              backgroundColor: COLOR_PRIMARY_F,
              primary: COLOR_PRIMARY_B,
            ),
      onPressed: () {
        unitCallBack(unitName);
      },
      child: Text(UNITS_NAME[unitName]),
    );
  }
}
