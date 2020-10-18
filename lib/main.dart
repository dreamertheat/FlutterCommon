
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home.dart';
import 'package:flutter_app/screens/Loading.dart';
import 'package:flutter_app/screens/SplashScreen.dart';

void main() {
  return runApp(MaterialApp(
    initialRoute: '/splash',
    routes: {
      "/loading" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/splash" : (context) => SplashScreen(),

    },

  ));
}


