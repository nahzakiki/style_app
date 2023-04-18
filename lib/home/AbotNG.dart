import 'package:flutter/material.dart';
import 'package:style_app/IndexPreview.dart';

class AboutNG extends StatefulWidget {
  const AboutNG({Key? key}) : super(key: key);

  @override
  State<AboutNG> createState() => _AboutNGState();
}

class _AboutNGState extends State<AboutNG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 179, 173, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text(
                'About NGstyle',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 241, 240, 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IndexPreview()));
                },
                child: Text('Exit'),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),primary: Color.fromRGBO(238, 111, 111, 1.0)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
