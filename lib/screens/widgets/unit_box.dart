import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/consts/tracers.dart';
import 'package:funradioactivity/screens/widgets/my_box.dart';
import 'package:funradioactivity/screens/widgets/unit_button.dart';

class UnitBox extends StatelessWidget {
  final Function actionCallback;

  UnitBox({this.actionCallback});

  @override
  Widget build(BuildContext context) {
    List<UnitButton> _units = [];
    UNITS.values.forEach((value) {
      _units.add(UnitButton(
        unitName: value,
        unitCallBack: actionCallback,
      ));
    });

    return MyBox(
      icon: ICON_ACTIVITY,
      title: BOX_UNIT_TITLE,
      input: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _units,
      ),
    );
  }
}
