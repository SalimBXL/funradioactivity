import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/texts.dart';
import 'package:funradioactivity/screens/home_page.dart';
import 'consts/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: COLOR_PRIMARY_B,
      ),
      home: HomePage(),
    );
  }
}
