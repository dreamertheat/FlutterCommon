
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home.dart';
import 'package:flutter_app/screens/Loading.dart';

void main() {
  return runApp(MaterialApp(
    initialRoute: '/loading',
    routes: {
      "/loading" : (context) => Loading(),
      "/home" : (context) => Home()

    },

  ));
}


