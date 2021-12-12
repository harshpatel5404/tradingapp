import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tradingapp/models/connection.dart';
import 'package:tradingapp/views/screen/constants.dart';
import 'package:tradingapp/views/screen/home_screen.dart';
import 'package:tradingapp/views/screen/mobile.dart';

import 'auth/Signup/components/signup_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
@override
void initState() {
  super.initState();
}
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName', width: size.width*0.70);
  }

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: kPrimaryColor),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: _buildImage('img1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Learn as you go",
            body:
                "Download the Stockpile app and master the market with our mini-lesson.",
            image: _buildImage('img2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Kids and teens",
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: _buildImage('img3.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () {
          Get.off(Mobilescreen());
        },
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: kPrimaryLightColor,
          activeSize: Size(22.0, 10.0),
          activeColor: kPrimaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),

        //rtl: true, // Display as right-to-left
        skip: const Text(
          'Skip',
          style: TextStyle(color: kPrimaryColor,fontSize: 17,),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: kPrimaryColor,
        ),
        done: const Text('Done',
            style:
                TextStyle(fontWeight: FontWeight.w600,fontSize: 17, color: kPrimaryColor)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
      ),
    );
  }
}
