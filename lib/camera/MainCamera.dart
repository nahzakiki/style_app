import 'package:flutter/material.dart';
import 'package:style_app/camera/Camera.dart';
import 'package:style_app/camera/Gellery.dart';

class MainCamera extends StatefulWidget {
  const MainCamera({Key? key}) : super(key: key);

  @override
  State<MainCamera> createState() => _MainCameraState();
}

class _MainCameraState extends State<MainCamera> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){
          _settingModalBottomSheet(context);
        });
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Camera'),
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return CameraPage();
                        }));
                      } ,
                    ),
                    ListTile(
                      title: const Text('Gallery'),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return GelleryPage();
                        }));
                      },
                    ),
                  ],
                ),

          );
        });
  }
}