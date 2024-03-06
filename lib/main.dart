import 'package:chatbot_geminiai/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'SixtyFour',
          scaffoldBackgroundColor: Color.fromARGB(255, 20, 49, 196),
          primaryColor: Colors.grey.shade900),
    );
  }
}