import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:style_app/home/ProfilePage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> genderItems = ['Male', 'Female', 'Non Binary'];
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //fontWeight: FontWeight.bold,
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
                style: TextStyle(
                    fontSize: 14,
                    fontFamily:
                        'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                decoration: const InputDecoration(
                    hintText: 'ความรู้สึกวันนี้',
                    contentPadding: EdgeInsets.all(15),
                    border: InputBorder.none),
                onChanged: (value) {},
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
                decoration: const InputDecoration(
                    hintText: 'Crimson',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
                onChanged: (value) {},
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
                              "1995",
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
                          hint: const Text(
                            "Gender",
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
                          onChanged: (value) {},
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
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Color.fromRGBO(18, 12, 12, 0.65)),
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

                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Color.fromRGBO(224, 29, 29, 0.65)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
