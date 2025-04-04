import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../components/gradient_background.dart';
import 'login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showFlash = false;
  bool coverScreen = false;
  double flashSize = 50;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      setState(() {
        showFlash = true;
      });

      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          flashSize = MediaQuery.of(context).size.height * 2;
        });
      });

      Future.delayed(Duration(milliseconds: 700), () {
        setState(() {
          coverScreen = true;
        });
      });

      Future.delayed(Duration(milliseconds: 1000), () {
        Get.off(
          () => LoginScreen(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 600),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The Way",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Lottie.asset('assets/flag.json'),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Shops, Saves, Celebrates",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (showFlash)
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  width: flashSize,
                  height: flashSize,
                  child: Image.asset('assets/flash.png', fit: BoxFit.cover),
                ),
              ),
            if (coverScreen)
              AnimatedContainer(
                duration: Duration(milliseconds: 700),
                width: double.infinity,
                height: double.infinity,
                color: Color.fromARGB(255, 244, 67, 54),
              ),
          ],
        ),
      ),
    );
  }
}
