import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:udemy_clone/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplash(
        imagePath: 'assets/images/splash_logo.png',
        home: LoginScreen(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
