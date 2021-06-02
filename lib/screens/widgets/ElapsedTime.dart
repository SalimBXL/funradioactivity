import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';

class ElapsedTime extends StatelessWidget {
  const ElapsedTime({
    Key key,
    @required this.elapsedTime,
  }) : super(key: key);

  final String elapsedTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$ELAPSED_TIME = $elapsedTime",
      style: TextStyle(
        fontSize: FONT_MEDIUM,
        color: COLOR_SECONDARY_F,
      ),
    );
  }
}
