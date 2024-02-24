import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_app/main.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  initScreen(BuildContext context) {
    return Scaffold(
      body: Container (
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/pokemon_logo.png"),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const SizedBox(height: 20.0),
            const Text(
              'Loading',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            SleekCircularSlider(
              initialValue: 90,
              appearance: CircularSliderAppearance(
                spinnerMode: true,
                size: 50,
                customColors: CustomSliderColors(
                    dotColor: Colors.black,
                    progressBarColor: Colors.black,
                    trackColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
}