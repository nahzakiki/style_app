import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/camera/PreviewPage.dart';
import 'package:style_app/home/HomePage.dart';
import 'package:style_app/home/ProfilePage.dart';

class IndexPreview extends StatefulWidget {
  const IndexPreview({Key? key}) : super(key: key);

  @override
  State<IndexPreview> createState() => _IndexPreview();
}

class _IndexPreview extends State<IndexPreview> with TickerProviderStateMixin {
  int currentTab = 0;

  List<Widget> screen = [
    HomePage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(75, 0, 130, 1.0),
        child: Icon(Icons.camera_alt),
        onPressed: () {
          _showModalSheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        //color: Color.fromRGBO(75, 0, 130, 1.0),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,
                            color: currentTab == 0
                                ? Color.fromRGBO(222, 179, 173, 1.0)
                                : Color.fromRGBO(223, 211, 248, 1.0)),
                        Text("Home",
                            style: TextStyle(
                                fontSize: 9,
                                color: currentTab == 0
                                    ? Color.fromRGBO(222, 179, 173, 1.0)
                                    : Color.fromRGBO(223, 211, 248, 1.0))),
                      ],
                    ),
                  ),
                ],
              ),
              //Right bar Icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                            color: currentTab == 1
                                ? Color.fromRGBO(222, 179, 173, 1.0)
                                : Color.fromRGBO(223, 211, 248, 1.0)),
                        Text("Home",
                            style: TextStyle(
                                fontSize: 9,
                                color: currentTab == 1
                                    ? Color.fromRGBO(222, 179, 173, 1.0)
                                    : Color.fromRGBO(223, 211, 248, 1.0))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  XFile? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PreviewPage(image: image)));

      //final imageTemporary = File(image.path);
      //final imagePermanent = await saveImagePermanent(image.path);
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
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
