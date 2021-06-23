import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/style.dart';
import 'package:funradioactivity/screens/form_page.dart';
import 'package:funradioactivity/screens/from_server_page.dart';
import 'package:funradioactivity/screens/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Counter();
}

class _Counter extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomePageButton(
              icon: ICON_CONNECT,
              label: "Get from Server",
              page: () {
                // final snackBar = SnackBar(
                //   content: Text(
                //     "Server not yet implemented. try ti fill the fields manually.",
                //   ),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FromServerPage(),
                  ),
                );
              },
            ),
            HomePageButton(
              icon: ICON_TYPE,
              label: "Fill manually",
              page: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    Key key,
    this.icon,
    this.label,
    this.page,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BOX_PADDING),
      child: ElevatedButton(
        child: Column(
          children: [
            Icon(
              icon,
              size: ICON_BIG_SIZE,
            ),
            Text(label),
          ],
        ),
        onPressed: page,
      ),
    );
  }
}
