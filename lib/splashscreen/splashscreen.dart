import 'dart:async';
import 'package:flutter/material.dart';

import '../introduction_screen/IntroductionScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => IntroductionScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/applogo.png',
              width: 900,
              height: 900,
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
