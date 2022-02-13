import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/large_screen.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/small_screen.dart';
import 'package:my_portfolio/widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context)) {
      return LargeHomeScreen();
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      return LargeHomeScreen();
    } else {
      return SmallHomeScreen();
    }
  }
}
