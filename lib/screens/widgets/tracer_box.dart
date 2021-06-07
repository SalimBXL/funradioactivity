import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/widgets/my_box.dart';
import 'package:funradioactivity/screens/widgets/tracer_button.dart';

class TracerBox extends StatelessWidget {
  final Function actionCallback;
  final TRACERS tracer;
  TracerBox({this.actionCallback, this.tracer});

  @override
  Widget build(BuildContext context) {
    List<TracerButton> _tracers = [];
    TRACERS.values.forEach((value) {
      _tracers.add(TracerButton(
        tracerName: value,
        selected: (tracer == value),
        tracerCallBack: actionCallback,
      ));
    });

    return Flexible(
      fit: FlexFit.loose,
      child: MyBox(
        icon: ICON_TRACER,
        title: BOX_TRACER_TITLE,
        input: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: _tracers,
        ),
      ),
    );
  }
}
