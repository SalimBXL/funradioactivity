import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/screens/widgets/my_box.dart';

class MeasureActivityBox extends StatelessWidget {
  final Function actionCallback;

  MeasureActivityBox({this.actionCallback});

  @override
  Widget build(BuildContext context) {
    return MyBox(
      icon: ICON_ACTIVITY,
      title: BOX_ACTIVITY_TITLE,
      input: TextField(
        onChanged: (value) {
          actionCallback(value);
        },
        keyboardType: TextInputType.number,
        maxLines: 1,
        maxLength: 6,
        expands: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '',
        ),
      ),
    );
  }
}
