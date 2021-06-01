import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';

import '../counter.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Counter widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_PRIMARY_B,
      child: Padding(
        padding: const EdgeInsets.all(BOX_PADDING),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.dose.activity.toString()} "
              "${UNITS_NAME[widget.dose.unit]}",
              style: TextStyle(
                color: COLOR_PRIMARY_F,
              ),
            ),
            Text(
              TRACERS_NAME[widget.dose.tracer],
              style: TextStyle(
                color: COLOR_PRIMARY_F,
                fontSize: FONT_BIG,
              ),
            ),
            Text(
              "@ ${widget.dose.humanizedTime}",
              style: TextStyle(
                color: COLOR_PRIMARY_F,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
