import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:udemy_clone/screens/navigation_bar_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NavBarScreen()),
        (Route<dynamic> route) => false);
  }

  Widget _buildImage(String assetName) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/$assetName.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0, color: Color(0xFF5F6565));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Text Here",
          body:
              "been try's standard dummy text ever since the 1500s, when an unknown printer took a gallery of typet to make a type specimen book. It has survived not only",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Text Here",
          body:
              "been try's standard dummy text ever since the 1500s, when an unknown printer took a gallery of typet to make a type specimen book. It has survived not only",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Text Here",
          body:
              "been try's standard dummy text ever since the 1500s, when an unknown printer took a gallery of typet to make a type specimen book. It has survived not only",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontFamily: "SF Pro Display Regular",
        ),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Start Learning',
          style: TextStyle(
            fontFamily: "SF Pro Display Regular",
          )),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
