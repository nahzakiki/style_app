import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:style_app/IndexPreview.dart';

class LoadingSelectPage extends StatefulWidget {
  const LoadingSelectPage({super.key});

  @override
  State<LoadingSelectPage> createState() => _LoadingSelectPageState();
}

class _LoadingSelectPageState extends State<LoadingSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromRGBO(222, 179, 173, 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 13.0,
              animation: true,
              percent: 1,
              progressColor: Color.fromRGBO(102, 54, 53, 1),
              center: new Text(
                "Processing...",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ElevatedButton(
                  onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const IndexPreview();
                          }));
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(102, 54, 53, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: const Text(
                    'GET START',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily:
                            'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
