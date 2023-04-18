import 'package:flutter/material.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/Login/Login.dart';
import 'package:style_app/Login/TermOfUse.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(222, 179, 173, 1.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGO1.png',
              fit: BoxFit.contain,
              height: 250,
              width: 250,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const TermsofUse();
                  }));
                },
                child: Text(
                  'GET START',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily:
                          'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.brown),
              ),
            )
          ],
        ),
      ),
    );
  }
}
