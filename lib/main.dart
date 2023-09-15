import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/location.dart';
import 'package:weather/Activity/loading.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      "/":(context)=>Loading(),
      "/home":(context)=>Home(),
      "/loading":(context)=>Loading(),
    },
    debugShowCheckedModeBanner: false,
  ));

}

