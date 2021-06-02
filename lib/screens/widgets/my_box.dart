import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';

class MyBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget input;

  MyBox({this.input, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: COLOR_SECONDARY_B,
      margin: EdgeInsets.all(BOX_PADDING),
      elevation: ELEVATION2,
      child: ListTile(
        leading: Icon(
          icon,
          color: COLOR_SECONDARY_F,
        ),
        title: input,
        // Text(
        //   title,
        //   style: TextStyle(
        //     color: COLOR_SECONDARY_F,
        //   ),
        // ),
        //subtitle: input,
      ),
    );
  }
}
