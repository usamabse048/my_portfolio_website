import "package:flutter/material.dart";

class MyAppbarActionButton extends StatefulWidget {
  MyAppbarActionButton(
      {Key? key, required this.text, required this.onTap, required this.onEnd})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  bool onEnd;

  @override
  _MyAppbarActionButtonState createState() => _MyAppbarActionButtonState();
}

class _MyAppbarActionButtonState extends State<MyAppbarActionButton> {
  Color appBarActionColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(
                color: appBarActionColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ))),
      onTap: widget.onTap,
      onHover: (val) {
        if (!widget.onEnd) {
          if (val) {
            setState(() {
              appBarActionColor = Colors.red;
            });
          } else {
            setState(() {
              appBarActionColor = Colors.white;
            });
          }
        }
      },
    );
  }
}
