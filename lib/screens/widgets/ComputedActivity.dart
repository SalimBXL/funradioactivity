import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/counter.dart';

class ComputedActivity extends StatelessWidget {
  const ComputedActivity({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Counter widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BOX_PADDING),
      child: Text(
        "${widget.dose.activity} ${UNITS_NAME[widget.dose.unit]}",
        style: TextStyle(
          fontSize: FONT_BIG,
          fontWeight: FontWeight.bold,
          color: COLOR_SECONDARY_F,
        ),
      ),
    );
  }
}
