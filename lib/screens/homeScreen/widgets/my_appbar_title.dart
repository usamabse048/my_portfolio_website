import 'package:flutter/material.dart';

class MyAppbarTitle extends StatelessWidget {
  const MyAppbarTitle({
    Key? key,
    required Color appBarTitleColor,
  })  : _appBarTitleColor = appBarTitleColor,
        super(key: key);

  final Color _appBarTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        RichText(
            text: TextSpan(
          text: "Portfo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
                text: "lio.",
                style: TextStyle(
                    fontSize: 28,
                    color: _appBarTitleColor,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w700))
          ],
        )),
      ],
    );
  }
}
