import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/screens/counter.dart';

class ElapsedTime extends StatelessWidget {
  const ElapsedTime({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Counter widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$ELAPSED_TIME = ${widget.dose.elapsedTime}",
      style: TextStyle(
        fontSize: FONT_MEDIUM,
        color: COLOR_SECONDARY_F,
      ),
    );
  }
}
