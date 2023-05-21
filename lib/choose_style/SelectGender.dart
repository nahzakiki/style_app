import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/choose_style/choose_style.dart';

import '../controller/user_state.dart';
import '../services/api.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  final List<String> genderItems = ['Male', 'Female', 'Not Gender'];
  String selectedGender = "";
  final userController = Get.put(UserController());

  @override
  void initState() {
   print(userController.userID);
   print(userController.birthDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(222, 179, 173, 1.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What's Gender?",
                style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromRGBO(254, 254, 254, 0.65),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(254, 254, 254, 0.65),
                        style: BorderStyle.solid)),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color.fromRGBO(254, 254, 254, 0.65),
                      contentPadding: const EdgeInsets.all(10.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color:
                              Color.fromRGBO(254, 254, 254, 0.65)),
                          borderRadius: BorderRadius.circular(50.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(254, 254, 254, 0.65)),
                          borderRadius: BorderRadius.circular(50.0))),
                  isExpanded: true,
                  hint: const Text(
                    "Gender",
                    style: TextStyle(fontSize: 14),
                  ),

                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Center(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedGender = value!;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 20, right: 20),
                  ),
                  iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.black12,
                      ),
                      iconSize: 30),
                  dropdownStyleData: DropdownStyleData(
                    padding: null,
                    offset: const Offset(0,-10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                  onPressed: () async {
                    var res = await Api().updateUserInfo("user", userController.birthDate, selectedGender, userController.userID);
                    if(res['message'] == "success") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const ChooseStyle();
                          }));
                    }
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
