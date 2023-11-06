import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/home/home_screen.dart';

class SplashScreen extends StatelessWidget{
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
