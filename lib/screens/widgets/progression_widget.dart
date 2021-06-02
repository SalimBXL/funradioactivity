import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';

class ActivityProgressionWidget extends StatelessWidget {
  const ActivityProgressionWidget({
    Key key,
    @required double progress,
  })  : _progress = progress,
        super(key: key);

  final double _progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(BOX_PADDING),
          child: CircularProgressIndicator(
            backgroundColor: COLOR_BACKGROUND,
            strokeWidth: BOX_PADDING,
            value: _progress,
          ),
        ),
        Text(
          "${(_progress * 100).toStringAsFixed(2)}%",
          style: TextStyle(
            color: COLOR_SECONDARY_F,
            fontSize: FONT_SMALL,
          ),
        ),
      ],
    );
  }
}
