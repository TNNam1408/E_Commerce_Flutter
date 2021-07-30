import 'package:e_commerce/screens/cartscreen.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}