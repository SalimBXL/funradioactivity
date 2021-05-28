import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';

Widget appBar() {
  return AppBar(
    leading: Icon(Icons.account_tree_outlined),
    title: Text("Fun Radioactivity"),
    elevation: ELEVATION1,
  );
}
