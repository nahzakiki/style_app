import 'package:flutter/material.dart';
import 'package:style_app/camera/Camera.dart';
import 'package:style_app/camera/Gallery.dart';
import 'package:style_app/camera/MainCamera.dart';
import 'package:style_app/home/HomePage.dart';
import 'package:style_app/home/ProfilePage.dart';

class IndexPreview extends StatefulWidget {
  const IndexPreview({Key? key}) : super(key: key);

  @override
  State<IndexPreview> createState() => _IndexPreview();
}

class _IndexPreview extends State<IndexPreview> with TickerProviderStateMixin {
  final List<String> StylesList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  int currentTab = 0;

  List<String> pageList = [
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  List<Widget> screen = [
    HomePage(),
    MainCamera(),
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

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context){
                          return const CameraPage();
                    }));
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context){
                        return const GalleryPage();
                      }));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
