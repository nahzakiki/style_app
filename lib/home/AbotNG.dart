import 'package:flutter/material.dart';

class AboutNG extends StatefulWidget {
  const AboutNG({Key? key}) : super(key: key);

  @override
  State<AboutNG> createState() => _AboutNGState();
}

class _AboutNGState extends State<AboutNG> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Text("About NG Style"),
    ],
    );
  }
}
