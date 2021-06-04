import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';

class BottomPanel extends StatelessWidget {
  final String tracer;
  final String activity;
  final String time;

  BottomPanel({this.tracer, this.activity, this.time});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: COLOR_PRIMARY_B,
      selectedItemColor: COLOR_PRIMARY_F,
      unselectedItemColor: COLOR_PRIMARY_F,
      items: [
        BottomNavigationBarItem(
          icon: Icon(ICON_TRACER),
          label: tracer,
        ),
        BottomNavigationBarItem(
          icon: Icon(ICON_ACTIVITY),
          label: activity,
        ),
        BottomNavigationBarItem(
          icon: Icon(ICON_TIME),
          label: time,
        ),
      ],
    );

    //
    // return Container(
    //   height: 50,
    //   color: COLOR_PRIMARY_B,
    //   //elevation: ELEVATION2,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Sticker(
    //         icon: ICON_TRACER,
    //         text: tracer,
    //       ),
    //       Sticker(
    //         icon: ICON_ACTIVITY,
    //         text: activity,
    //       ),
    //       Sticker(
    //         icon: ICON_TIME,
    //         text: time,
    //       ),
    //     ],
    //   ),
    // );
  }
}
