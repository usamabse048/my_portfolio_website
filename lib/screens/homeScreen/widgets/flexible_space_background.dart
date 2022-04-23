import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FlexibleSpaceBackground extends StatelessWidget {
  const FlexibleSpaceBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/appbar_bg.jpg",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: 300,
        child: SizedBox(
          height: 400,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello, my name is",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "USAMA ILYAS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "And I am a ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 30.0, color: Colors.red),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Software Engineer',
                            speed: const Duration(milliseconds: 150)),
                        TypewriterAnimatedText('Flutter Developer',
                            speed: const Duration(milliseconds: 150)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
