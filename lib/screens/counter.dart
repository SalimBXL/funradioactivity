import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/models/dose.dart';
import 'package:funradioactivity/screens/widgets/ComputedActivity.dart';
import 'package:funradioactivity/screens/widgets/ElapsedTime.dart';
import 'package:funradioactivity/screens/widgets/UpperBar.dart';
import 'package:funradioactivity/screens/widgets/appbar.dart';

class Counter extends StatefulWidget {
  Counter({@required this.dose});
  final Dose dose;

  @override
  State<StatefulWidget> createState() => _Counter();
}

class _Counter extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      appBar: appBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLOR_PRIMARY_B,
        foregroundColor: COLOR_PRIMARY_F,
        child: Icon(Icons.refresh),
        onPressed: () {},
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UpperBar(widget: widget),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: ICON_BIG_SIZE / 2, bottom: ICON_BIG_SIZE / 2),
                  child: Icon(
                    Icons.play_circle_outline_outlined,
                    size: ICON_BIG_SIZE,
                    color: COLOR_FOREGROUND,
                  ),
                ),
                Card(
                  color: COLOR_SECONDARY_B,
                  elevation: ELEVATION1,
                  child: Padding(
                    padding: const EdgeInsets.all(BOX_PADDING),
                    child: Column(
                      children: [
                        ElapsedTime(widget: widget),
                        ComputedActivity(widget: widget),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
