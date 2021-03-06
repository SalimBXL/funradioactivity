import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/widgets/activity_box.dart';
import 'package:funradioactivity/screens/widgets/appbar.dart';
import 'package:funradioactivity/screens/widgets/bottom_panel.dart';
import 'package:funradioactivity/screens/widgets/go_compute.dart';
import 'package:funradioactivity/screens/widgets/time_box.dart';
import 'package:funradioactivity/screens/widgets/tracer_box.dart';
import 'package:funradioactivity/screens/widgets/unit_box.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  TRACERS measureTracerValue;
  UNITS unitValue;
  double measureActivityValue;
  TimeOfDay measureTimeValue;

  @override
  void initState() {
    super.initState();
    measureActivityValue = 0.0;
    measureTimeValue = TimeOfDay.now();
    measureTracerValue = TRACERS.values[0];
    unitValue = UNITS.values[0];
  }

  void setTracerValue(TRACERS value) {
    setState(() {
      measureTracerValue = value;
    });
  }

  void setUnitValue(UNITS value) {
    setState(() {
      unitValue = value;
    });
  }

  void setTimeValue(TimeOfDay value) {
    setState(() {
      measureTimeValue = value;
    });
  }

  void setActivityValue(String value) {
    setState(() {
      measureActivityValue = double.parse(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      appBar: appBar(),
      bottomNavigationBar: BottomPanel(
        tracer: TRACERS_NAME[measureTracerValue],
        activity: "${measureActivityValue.toString()} ${UNITS_NAME[unitValue]}",
        time: "${(measureTimeValue.hour < 10) ? "0" : ""}"
            "${measureTimeValue.hour}:"
            "${(measureTimeValue.minute < 10) ? "0" : ""}"
            "${measureTimeValue.minute}",
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TracerBox(actionCallback: setTracerValue, tracer: measureTracerValue),
          UnitBox(actionCallback: setUnitValue, unit: unitValue),
          MeasureActivityBox(actionCallback: setActivityValue),
          MeasureTimeBox(
            actionCallback: setTimeValue,
            measureActivityValue: measureActivityValue,
            measureTimeValue: measureTimeValue,
            measureTracerValue: measureTracerValue,
            unitValue: unitValue,
          ),
          GoCompute(
              measureTimeValue: measureTimeValue,
              measureTracerValue: measureTracerValue,
              unitValue: unitValue,
              measureActivityValue: measureActivityValue),
        ],
      ),
    );
  }
}
