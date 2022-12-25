import 'package:flutter/material.dart';
import 'package:style_app/camera/Camera.dart';
import 'package:style_app/camera/Gellery.dart';

class MainCamera extends StatefulWidget {
  const MainCamera({Key? key}) : super(key: key);

  @override
  State<MainCamera> createState() => _MainCameraState();
}

class _MainCameraState extends State<MainCamera> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Yuyuyu'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(onPressed: (){_showModalSheet();}),
            )
          ],
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
                  // Handle camera option tap
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  // Handle gallery option tap
                },
              ),
            ],
          ),
        );
      },
    );
  }
}