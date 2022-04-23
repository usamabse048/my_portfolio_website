import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/homeScreen/widgets/section_heading.dart';
import 'package:my_portfolio/widgets/responsive_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 650,
      width: screenWidth,
      color: Colors.white,
      child: Column(
        children: [
          const SectionHeading(
              heading: "About",
              subheading: "who I am",
              headingColor: Colors.black),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/aboutImage.jpeg",
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    if (ResponsiveWidget.isLargeScreen(context))
                      Row(
                        children: [
                          const Text(
                            "I am Usama Ilyas and I am ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 24.0, color: Colors.red),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Software Engineer',
                                  speed: const Duration(milliseconds: 150),
                                ),
                                TypewriterAnimatedText(
                                  'Flutter Developer',
                                  speed: const Duration(milliseconds: 150),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (ResponsiveWidget.isMediumScreen(context))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "I am Usama Ilyas and",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          ),
                          Row(
                            children: [
                              const Text(
                                "I am ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 24.0, color: Colors.red),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Software Engineer',
                                      speed: const Duration(milliseconds: 150),
                                    ),
                                    TypewriterAnimatedText(
                                      'Flutter Developer',
                                      speed: const Duration(milliseconds: 150),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "I am a Software Engineer and Flutter Developer, recently graduated from COMSATS University Islamabad. I have experience of more than two years in Mobile Application Development. As a freelancer I have worked with clients from all accross the world. I am a good problem solver and love to work in teams. ",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
