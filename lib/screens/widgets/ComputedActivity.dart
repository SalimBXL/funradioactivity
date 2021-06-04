import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/counter.dart';

class ComputedActivity extends StatelessWidget {
  const ComputedActivity({
    Key key,
    @required this.widget,
    @required this.computedActivity,
    @required this.unit,
  }) : super(key: key);

  final Counter widget;
  final String computedActivity;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(BOX_PADDING),
          child: Text(
            "$computedActivity $unit",
            style: TextStyle(
              fontSize: FONT_BIG,
              fontWeight: FontWeight.bold,
              color: COLOR_SECONDARY_F,
            ),
          ),
        ),
        SmallTextActivity(
          computedActivity: computedActivity,
          unit: unit,
          widget: widget,
        ),
      ],
    );
  }
}

class SmallTextActivity extends StatelessWidget {
  const SmallTextActivity({
    Key key,
    @required this.computedActivity,
    @required this.unit,
    @required this.widget,
  }) : super(key: key);

  final Counter widget;
  final String computedActivity;
  final String unit;

  @override
  Widget build(BuildContext context) {
    List<Widget> activities = [];
    UNITS.values.forEach((unit) {
      if (widget.dose.unit != unit) {
        activities.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "${widget.dose.computedActivityInUnit(unit).toStringAsFixed(DIGITS_AFTER)}",
              style: TextStyle(
                fontSize: FONT_SMALL,
                fontWeight: FontWeight.bold,
                color: COLOR_SECONDARY_F,
              ),
            ),
            Text(
              "${UNITS_NAME[unit]}",
              style: TextStyle(
                fontSize: FONT_SMALL,
                fontWeight: FontWeight.bold,
                color: COLOR_SECONDARY_F,
              ),
            ),
          ],
        ));
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: activities,
    );
  }
}
