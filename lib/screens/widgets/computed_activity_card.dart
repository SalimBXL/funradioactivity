import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/screens/counter.dart';
import 'package:funradioactivity/screens/widgets/ComputedActivity.dart';
import 'package:funradioactivity/screens/widgets/ElapsedTime.dart';
import 'package:funradioactivity/screens/widgets/progression_widget.dart';

class ComputedActivityCard extends StatelessWidget {
  const ComputedActivityCard({
    Key key,
    @required double progress,
    @required String elapsedTime,
    @required this.widget,
    @required String computedActivity,
    @required String unit,
  })  : _progress = progress,
        _elapsedTime = elapsedTime,
        _computedActivity = computedActivity,
        _unit = unit,
        super(key: key);

  final double _progress;
  final String _elapsedTime;
  final Counter widget;
  final String _computedActivity;
  final String _unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: COLOR_SECONDARY_B,
      elevation: ELEVATION1,
      child: Padding(
        padding: const EdgeInsets.all(BOX_PADDING),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(BOX_PADDING),
              child: ActivityProgressionWidget(progress: _progress),
            ),
            Column(
              children: [
                ElapsedTime(
                  elapsedTime: _elapsedTime,
                ),
                ComputedActivity(
                  widget: widget,
                  computedActivity: _computedActivity,
                  unit: _unit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
