import 'dart:convert';
import 'dart:io';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/Login/Login.dart';
import 'package:style_app/controller/user_state.dart';
import 'package:style_app/home/AbotNG.dart';
import 'package:style_app/home/EditProfile.dart';
import 'package:style_app/services/api.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userController = Get.put(UserController());

  @override
  void initState() {
    print(userController.image);
    super.initState();
  }

  void logout() async {
    try {
      await LineSDK.instance.logout();
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(219, 221, 243, 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(65.0),
                      child: Image.network(userController.image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              userController.displayName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          //const SizedBox(height: 10),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(219, 221, 243, 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text('My Blog',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.6))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    userController.status,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const EditProfile();
                  }));
                },
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(252, 222, 116, 1.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AboutNG();
                  }));
                },
                child: const Text(
                  "About NGstyle",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(252, 222, 116, 1.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(238, 111, 111, 1.0),
                shape: StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) => PreviewPage(image: image)));*/

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanent(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e ');
    }
  }

  Future<File> saveImagePermanent(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = base64Decode(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //image != null ? PreviewPage(image: image!) : FlutterLogo(size: 100),
              //const SizedBox(height: 100),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () => pickImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
  }
}
