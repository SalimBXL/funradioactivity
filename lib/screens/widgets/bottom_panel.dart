import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/screens/widgets/sticker.dart';

class BottomPanel extends StatelessWidget {
  final String tracer;
  final String activity;
  final String time;

  BottomPanel({this.tracer, this.activity, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_PRIMARY_B,
      //elevation: ELEVATION2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Sticker(
            icon: ICON_TRACER,
            text: tracer,
          ),
          Sticker(
            icon: ICON_ACTIVITY,
            text: activity,
          ),
          Sticker(
            icon: ICON_TIME,
            text: time,
          ),
        ],
      ),
    );
  }
}
