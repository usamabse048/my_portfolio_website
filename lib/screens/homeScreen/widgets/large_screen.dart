// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:my_portfolio/widgets/my_appbar_action_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height,
                  floating: false,
                  pinned: true,
                  //backgroundColor: Colors.red,
                  centerTitle: false,
                  title: Row(
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
                  ),
                  backgroundColor: Colors.red,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                    Image.asset(
                      "assets/images/appbar_bg.jpg",
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: 300,
                      child: Container(
                        height: 400,
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, my name is",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "USAMA ILYAS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "And I am a ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                      fontSize: 30.0, color: Colors.red),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                          'Software Engineer',
                                          speed: Duration(milliseconds: 150)),
                                      TypewriterAnimatedText(
                                          'Flutter Developer',
                                          speed: Duration(milliseconds: 150)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),
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
                      text: "Skills",
                      onTap: () {
                        _controller.animateTo(2 * screenHeight,
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
                        _controller.animateTo(3 * screenHeight,
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
                        _controller.animateTo(4 * screenHeight,
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
                        _controller.animateTo(5 * screenHeight,
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow,
                    child: Center(
                      child: Text(
                        "About",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "Skills",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
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
                    height: MediaQuery.of(context).size.height,
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
                    height: MediaQuery.of(context).size.height,
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
        body: Container(),
      ),
    );
  }
}
