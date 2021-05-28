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
      margin: EdgeInsets.all(16),
      elevation: ELEVATION2,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: input,
      ),
    );
  }
}
