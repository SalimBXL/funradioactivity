import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';

class TracerButton extends StatelessWidget {
  final TRACERS tracerName;
  final Function tracerCallBack;
  final bool selected;

  TracerButton({this.tracerName, this.tracerCallBack, this.selected = false});

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
        tracerCallBack(tracerName);
      },
      child: Text(
        TRACERS_NAME[tracerName],
        softWrap: false,
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    );
  }
}
