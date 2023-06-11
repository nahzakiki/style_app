import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/controller/user_state.dart';
import 'package:style_app/home/ProfilePage.dart';

import '../services/api.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> genderItems = ['Male', 'Female', 'Not Gender'];
  final userController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;
    TextEditingController _controllerName = TextEditingController(text: userController.displayName);
    TextEditingController _controllerStatus = TextEditingController(text: userController.status);
    String selectedGender = userController.gender;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(249, 241, 240, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 30.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "MY BLOG",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(254, 254, 254, 0.65),
                  border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(254, 254, 254, 0.65),
                      style: BorderStyle.solid)),
              child: TextFormField(
                controller: _controllerStatus,
                maxLength: 300,
                maxLines: 5,
                minLines: 1,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily:
                        'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                decoration: const InputDecoration(
                    hintText: 'ความรู้สึกวันนี้',
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none),
                onChanged: (value) {
                  userController.setStatust(_controllerStatus.text);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 30.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Profile Name",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color.fromRGBO(254, 254, 254, 0.65),
                  border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(254, 254, 254, 0.65),
                      style: BorderStyle.solid)),
              child: TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    hintText: 'Enter New Name',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
                onChanged: (value) {
                  userController.setDisplayName(_controllerName.text);
                },
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 30.0, bottom: 5.0),
                      child: Text(
                        "Birthday's",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color.fromRGBO(254, 254, 254, 0.65),
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(254, 254, 254, 0.65),
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              userController.birthDate,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 30.0, bottom: 5.0),
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color.fromRGBO(254, 254, 254, 0.65),
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(254, 254, 254, 0.65),
                                style: BorderStyle.solid)),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Color.fromRGBO(254, 254, 254, 0.65),
                              contentPadding: EdgeInsets.all(10.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(254, 254, 254, 0.65)),
                                  borderRadius: BorderRadius.circular(50.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromRGBO(254, 254, 254, 0.65)),
                                  borderRadius: BorderRadius.circular(50.0))),
                          isExpanded: true,
                          value: userController.gender,
                          hint: Text(
                            userController.gender,
                            style: TextStyle(fontSize: 13),
                          ),
                          items: genderItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 14),
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
                          onSaved: (value) {
                            selectedGender = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(left: 5, right: 5),
                          ),
                          iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.black12,
                              ),
                              iconSize: 30),
                          dropdownStyleData: DropdownStyleData(
                            padding: null,
                            offset: const Offset(0,-5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    var res = await Api().EditUserInfo("edit",_controllerStatus.text, _controllerName.text, selectedGender, userController.userID );
                    if(res['message'] == "success") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return  IndexPreview();
                          }));
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(18, 12, 12, 0.65)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IndexPreview()),
                    );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(224, 29, 29, 0.65)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
