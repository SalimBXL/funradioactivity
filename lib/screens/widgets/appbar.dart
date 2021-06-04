import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/consts/texts.dart';

Widget appBar() {
  return AppBar(
    leading: Icon(Icons.account_tree_outlined),
    title: Text(APP_TITLE),
    elevation: ELEVATION1,
  );
}
