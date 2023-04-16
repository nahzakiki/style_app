import 'dart:convert';
import 'dart:io';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/home/AbotNG.dart';
import 'package:style_app/home/EditProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Stack(
              children: [
                AvatarView(
                  radius: 65,
                  borderWidth: 6,
                  borderColor: Color.fromRGBO(219, 221, 243, 1.0),
                  avatarType: AvatarType.CIRCLE,
                  //backgroundColor:  Color.fromRGBO(219, 221, 243, 1.0),
                  imagePath: "assets/images/S__5963780.jpg",
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      _showModalSheet();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromRGBO(219, 221, 243, 1.0)),
                      child: Icon(Icons.edit_rounded,
                          color: Color.fromRGBO(35, 31, 32, 0.6)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Crimson bababa",
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
            child: Center(
                child: Text('My Blog',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.6)))),
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
              onPressed: () {},
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
