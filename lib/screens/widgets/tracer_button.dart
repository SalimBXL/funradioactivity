import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/tracers.dart';

class TracerButton extends StatelessWidget {
  final TRACERS tracerName;
  final Function tracerCallBack;

  TracerButton({this.tracerName, this.tracerCallBack});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        tracerCallBack(tracerName);
      },
      child: Text(TRACERS_NAME[tracerName]),
    );
  }
}
