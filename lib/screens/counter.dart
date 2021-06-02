import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/models/dose.dart';
import 'package:funradioactivity/screens/widgets/UpperBar.dart';
import 'package:funradioactivity/screens/widgets/appbar.dart';
import 'package:funradioactivity/screens/widgets/computed_activity_card.dart';

class Counter extends StatefulWidget {
  Counter({@required this.dose});
  final Dose dose;

  @override
  State<StatefulWidget> createState() => _Counter();
}

class _Counter extends State<Counter> {
  String _elapsedTime;
  String _computedActivity;
  String _unit;
  double _progress;

  void updateValues() {
    setState(() {
      _elapsedTime = widget.dose.elapsedTime;
      _computedActivity = widget.dose.computedActivity.toString();
      _unit = UNITS_NAME[widget.dose.unit];
      _progress = (widget.dose.computedActivity / widget.dose.activity);
    });
  }

  @override
  void initState() {
    super.initState();
    updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      appBar: appBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLOR_PRIMARY_B,
        foregroundColor: COLOR_PRIMARY_F,
        child: Icon(Icons.refresh),
        onPressed: () {
          updateValues();
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UpperBar(widget: widget),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  //width: 200.0,
                  height: 200.0,
                  image: AssetImage('assets/images/radiation.jpg'),
                ),
                ComputedActivityCard(
                  progress: _progress,
                  elapsedTime: _elapsedTime,
                  widget: widget,
                  computedActivity: _computedActivity,
                  unit: _unit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
