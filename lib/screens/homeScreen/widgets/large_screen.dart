// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/about_section.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/flexible_space_background.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/my_appbar_title.dart';

import 'package:my_portfolio/widgets/my_appbar_action_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_portfolio/widgets/responsive_widget.dart';

class LargeHomeScreen extends StatefulWidget {
  const LargeHomeScreen({Key? key}) : super(key: key);

  @override
  State<LargeHomeScreen> createState() => _LargeHomeScreenState();
}

class _LargeHomeScreenState extends State<LargeHomeScreen> {
  bool onEnd = false;
  Color _appBarTitleColor = Colors.red;

  double screenHeight = 0;
  double screenWidth = 0;
  double stopScrolling = 0;
  bool zenda = false;

  final ScrollController _controller = ScrollController();
  //final ScrollController _columnScrollController = ScrollController();
  _scrollListener() {
    if (_controller.offset > screenHeight * 5 + 1) {
      _controller.jumpTo(screenHeight * 5);
    }
    if (_controller.offset >= screenHeight - 80 &&
        !_controller.position.outOfRange &&
        !onEnd) {
      setState(() {
        onEnd = true;
        _appBarTitleColor = Colors.white;
      });
    }
    if (_controller.offset <= screenHeight - 80 &&
        !_controller.position.outOfRange &&
        onEnd) {
      setState(() {
        onEnd = false;
        _appBarTitleColor = Colors.red;
      });
    }
    if (_controller.offset > screenHeight + 4 * 650 + 1) {
      _controller.jumpTo(screenHeight + 4 * 650);
    }
  }

  void goback() {
    _controller.animateTo(0,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  void initState() {
    _controller.addListener(_scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    stopScrolling = screenHeight * 2;
    return Scaffold(
      body: NestedScrollView(
          controller: _controller,
          physics: ScrollPhysics(parent: ClampingScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height,
                    floating: false,
                    pinned: true,
                    //backgroundColor: Colors.red,
                    centerTitle: false,
                    title: MyAppbarTitle(appBarTitleColor: _appBarTitleColor),
                    backgroundColor: Colors.red,
                    flexibleSpace:
                        FlexibleSpaceBar(background: FlexibleSpaceBackground()),

                    actions: [
                      MyAppbarActionButton(
                        text: "Home",
                        onTap: () {
                          _controller.animateTo(0,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyAppbarActionButton(
                        text: "About",
                        onTap: () {
                          _controller.animateTo(screenHeight,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyAppbarActionButton(
                        text: "Services",
                        onTap: () {
                          _controller.animateTo(screenHeight + 650,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyAppbarActionButton(
                        text: "Skills",
                        onTap: () {
                          _controller.animateTo(screenHeight + 2 * 650,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyAppbarActionButton(
                        text: "My Work",
                        onTap: () {
                          _controller.animateTo(screenHeight + 3 * 650,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyAppbarActionButton(
                        text: "Contact",
                        onTap: () {
                          _controller.animateTo(screenHeight + 4 * 650,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 500));
                        },
                        onEnd: onEnd,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AboutSection(screenWidth: screenWidth),
                    Container(
                      height: 650,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "Services",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 650,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.yellow,
                      child: Center(
                        child: Text(
                          "Skills",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 650,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.cyanAccent,
                      child: Center(
                        child: Text(
                          "My Work",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      height: 650,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "Contact",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: Container(
            height: 100,
            width: screenWidth,
            color: Colors.blue,
          )),
    );
  }
}
