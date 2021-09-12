import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/home/home.dart';

class SplashApp extends StatefulWidget {
  SplashApp({Key? key}) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.off(() => Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.pink[50],
          child: Center(
            child: Container(
              child: Image.asset('./images/shong_splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
