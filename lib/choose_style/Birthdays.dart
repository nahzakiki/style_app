import 'package:flutter/material.dart';
import 'package:style_app/choose_style/choose_style.dart';

class Birthdays extends StatefulWidget {
  const Birthdays({Key? key}) : super(key: key);

  @override
  State<Birthdays> createState() => _BirthdaysState();
}

class _BirthdaysState extends State<Birthdays> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(222, 179, 173, 1.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Birthday's",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const ChooseStyle();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(102, 54, 53, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily:
                          'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                )),
          ],
        ),
      ),
    );
  }
}
