import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/choose_style/SelectGender.dart';
import 'package:style_app/choose_style/choose_style.dart';
import 'package:style_app/controller/user_state.dart';

class Birthdays extends StatefulWidget {
  const Birthdays({Key? key}) : super(key: key);

  @override
  State<Birthdays> createState() => _BirthdaysState();
}

class _BirthdaysState extends State<Birthdays> {

  TextEditingController _controller = TextEditingController();
  final userController = Get.put(UserController());

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
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: 'ปีเกิดของคุณ เช่น 1995',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none),
                  onChanged: (value) {
                    if(_controller.text.length <= 4) {
                      userController.setBirthDate(_controller.text);
                    }else{
                      setState(() {
                        _controller.text = _controller.text.substring(0,5);
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SelectGender();
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
            ),
          ],
        ),
      ),
    );
  }
}
