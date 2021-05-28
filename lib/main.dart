import 'package:flutter/material.dart';
import 'package:funradioactivity/screens/form_page.dart';
import 'consts/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: COLOR_PRIMARY_B,
      ),
      home: FormPage(),
    );
  }
}
