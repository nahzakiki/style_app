import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/services/api.dart';

import '../controller/user_state.dart';

class LoadingSelectPage extends StatefulWidget {
  const LoadingSelectPage({super.key});

  @override
  State<LoadingSelectPage> createState() => _LoadingSelectPageState();
}

class _LoadingSelectPageState extends State<LoadingSelectPage> {

  double _percent = 0;
  final userController = Get.put(UserController());
  Timer? _timer;
  bool _finish = false;

  @override
  void initState() {
    timer();
    super.initState();
  }

  void timer() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => setState(() {
      _percent += 0.01;
    }));
    var s = await Api().imageSearchForNew("image/search/new", userController.top1, userController.top2, userController.top3,
        userController.low1, userController.low2, userController.low3,
        userController.shoe1, userController.shoe2, userController.shoe3, userController.userID);
    _timer?.cancel();
    setState(() {
      _percent = 1.0;
      _finish = true;
    });
  }

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
              percent: _percent,
              progressColor: const Color.fromRGBO(102, 54, 53, 1),
              center: Text(
                _finish ? "Complete" : "Processing...",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: ElevatedButton(
                  onPressed: _finish ? () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const IndexPreview();
                          }));
                        }: null,
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
