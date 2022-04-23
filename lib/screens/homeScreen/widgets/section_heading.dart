import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(
      {Key? key,
      required this.heading,
      required this.subheading,
      required this.headingColor})
      : super(key: key);

  final String heading, subheading;
  final Color headingColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          heading,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 3, width: 30, color: headingColor),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subheading,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 3,
              width: 30,
              color: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}
