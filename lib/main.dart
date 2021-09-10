import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shong_app/Page/splash_start/splash_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '숑고마켓',
      theme: ThemeData(
        primaryColor: Colors.pink[50],
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: SplashApp(),
    );
  }
}
