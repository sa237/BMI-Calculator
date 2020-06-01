import 'package:flutter/material.dart';
import './imput_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF0A0E21),
        accentColor: Colors.pink,
        scaffoldBackgroundColor: Color(0XFF0A0E21),

      ),
      home: InputPage(),
    );
  }
}