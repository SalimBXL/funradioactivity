import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';

class Sticker extends StatelessWidget {
  final IconData icon;
  final String text;

  Sticker({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BOX_PADDING),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(BOX_PADDING),
            child: Icon(
              icon,
              color: COLOR_PRIMARY_F,
            ),
          ),
          Text(
            text.toString(),
            style: TextStyle(color: COLOR_PRIMARY_F),
          ),
        ],
      ),
    );
  }
}
