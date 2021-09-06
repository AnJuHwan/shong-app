import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/home.dart';

class SplashApp extends StatefulWidget {
  SplashApp({Key? key}) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '숑아마켓',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Image.asset('./images/shong_splash.png'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
