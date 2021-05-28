import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/widgets/activity_box.dart';
import 'package:funradioactivity/screens/widgets/appbar.dart';
import 'package:funradioactivity/screens/widgets/bottom_panel.dart';
import 'package:funradioactivity/screens/widgets/sticker.dart';
import 'package:funradioactivity/screens/widgets/time_box.dart';
import 'package:funradioactivity/screens/widgets/tracer_box.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPage();
}

class _FormPage extends State<FormPage> {
  TRACERS measureTracerValue;
  double measureActivityValue;
  DateTime measureTimeValue;

  @override
  void initState() {
    super.initState();
    measureActivityValue = 0.0;
    measureTimeValue = DateTime.now();
    measureTracerValue = TRACERS.values[0];
  }

  void setTracerValue(TRACERS value) {
    setState(() {
      measureTracerValue = value;
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
      appBar: appBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TracerBox(actionCallback: setTracerValue),
              MeasureActivityBox(actionCallback: setActivityValue),
              MeasureTimeBox(),
            ],
          ),
          BottomPanel(
            tracer: TRACERS_NAME[measureTracerValue],
            activity: measureActivityValue.toString(),
            time: "${measureTimeValue.hour}:"
                "${(measureTimeValue.minute < 10) ? "0" : ""}"
                "${measureTimeValue.minute}",
          ),
        ],
      ),
    );
  }
}
