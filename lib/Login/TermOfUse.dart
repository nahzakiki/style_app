import 'package:flutter/material.dart';
import 'package:style_app/Login/Login.dart';
import 'package:style_app/choose_style/Birthdays.dart';
import 'package:style_app/choose_style/choose_style.dart';
import 'package:style_app/home/StartPage.dart';

class TermsofUse extends StatefulWidget {
  const TermsofUse({Key? key}) : super(key: key);

  @override
  State<TermsofUse> createState() => _TermsofUseState();
}

class _TermsofUseState extends State<TermsofUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 179, 173, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text(
                'Terms of use',
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
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Birthdays()));
                  },
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),primary: Color.fromRGBO(130, 190, 129, 1.0)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartPage()));
                  },
                  child: Text('Decline'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),primary: Color.fromRGBO(238, 111, 111, 1.0)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
