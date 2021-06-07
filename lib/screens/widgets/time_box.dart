import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/widgets/my_box.dart';

class MeasureTimeBox extends StatelessWidget {
  final Function actionCallback;
  final TimeOfDay measureTimeValue;
  final TRACERS measureTracerValue;
  final UNITS unitValue;
  final double measureActivityValue;

  MeasureTimeBox({
    @required this.actionCallback,
    @required this.measureTimeValue,
    @required this.measureTracerValue,
    @required this.unitValue,
    @required this.measureActivityValue,
  });

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay picked;
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
    if (picked != null && picked != _time) {
      _time = picked;
      actionCallback(_time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyBox(
      icon: ICON_TIME,
      title: BOX_TIME_TITLE,
      input: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {
              selectTime(context);
            },
            child: Text(BOX_TIME_BUTTON),
          ),
        ],
      ),
    );
  }
}
