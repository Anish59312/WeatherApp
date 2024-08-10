import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/ui/MyHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'my weather app',),
    );
  }
}