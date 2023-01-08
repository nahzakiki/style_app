import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/home/HomePage.dart';

class PreviewPage extends StatelessWidget {
  final XFile image;
  String albumName = 'Media';
  PreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final color = Theme.of(context).colorScheme.primary;
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const IndexPreview()));
                    },
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('Street Style', style: TextStyle(fontSize: 36)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: Size(300, 450),
                child:
                    Image.file(File(image.path), fit: BoxFit.cover, width: 300),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Material(
                    color: Color.fromRGBO(222, 216, 244, 1.0),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.refresh_outlined),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Color.fromRGBO(222, 216, 244, 1.0),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () async {},
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(Icons.file_download_outlined),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      PreviewPage(image: image);

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

}
