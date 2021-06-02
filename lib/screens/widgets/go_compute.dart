import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/models/dose.dart';
import 'package:funradioactivity/screens/counter.dart';

class GoCompute extends StatelessWidget {
  const GoCompute({
    Key key,
    @required this.measureTimeValue,
    @required this.measureTracerValue,
    @required this.unitValue,
    @required this.measureActivityValue,
  }) : super(key: key);

  final TimeOfDay measureTimeValue;
  final TRACERS measureTracerValue;
  final UNITS unitValue;
  final double measureActivityValue;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: ELEVATION2,
      color: COLOR_PRIMARY_B,
      child: Icon(
        Icons.play_circle_outline_outlined,
        color: COLOR_PRIMARY_F,
      ),
      onPressed: () {
        if (!(measureTimeValue != null &&
            measureTracerValue != null &&
            unitValue != null &&
            measureActivityValue > 0)) {
          final snackBar = SnackBar(
            content: Text(
              ERROR_MESSAGE_NOT_READY,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
        Dose _myDose = Dose(
            unit: unitValue,
            activity: measureActivityValue,
            tracer: measureTracerValue,
            time: measureTimeValue);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Counter(
                    dose: _myDose,
                  )),
        );
      },
    );
  }
}
