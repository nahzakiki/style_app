import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key,required this.camera}) : super(key: key);

  final List<CameraDevice>? camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
   File? _image;

   Future getImage() async{
     final image = await ImagePicker().pickImage(source: ImageSource.camera);
     if( image == null){
       return;
     }

     final imageTenporary = File(image.path);

     setState(() {
       this._image = imageTenporary;
     });
   }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
