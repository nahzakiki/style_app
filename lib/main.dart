import 'package:flutter/material.dart';
import 'package:style_app/home/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Balooda',
      ),
      home: const StartPage(),
    );
  }
}
