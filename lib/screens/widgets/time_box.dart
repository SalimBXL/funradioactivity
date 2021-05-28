import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/screens/widgets/my_box.dart';

class MeasureTimeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBox(
      icon: ICON_TIME,
      title: "Heure de la mesure",
      input: Row(
        children: [
          Text("ok"),
          OutlinedButton(
            onPressed: () {},
            child: Text('Click Me'),
          ),
        ],
      ),
    );
  }
}
