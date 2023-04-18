import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/services/api.dart';

class PreviewPage extends StatefulWidget {
  final XFile image;
  const PreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late XFile image;
  String albumName = 'Media';

  late Future<List> result;
  Future<List> _getResult() async{
    return await Api().submit("predict", image);
  }

  @override
  void initState(){
    super.initState();
    this.image = widget.image;
    this.result = _getResult();
  }

  @override
  Widget build(BuildContext context) {
    //ฟังก์ชันเก็บภาพ
    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PreviewPage(image: image)));

        final imagePermanent = await saveImagePermanent(image.path);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e ');
      }
    }

    void _showMaterialDialog(String title, String msg) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(msg, style: Theme.of(context).textTheme.labelLarge),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            actions: [
              // ปุ่ม OK ใน dialog
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
                child: const Text('OK'),
                onPressed: () {
                  // ปิด dialog
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IndexPreview()));
                    },
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text('Street Style', style: TextStyle(fontSize: 36)),
              ],
            ),
          ),
          //Text('Street Style', style: TextStyle(fontSize: 36)),
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                  child: Material(
                    color: Color.fromRGBO(222, 216, 244, 1.0),
                    child: InkWell(
                      splashColor: Color.fromRGBO(222, 179, 173, 1.0),
                      onTap: () async {
                        _showModalSheet();
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
                      splashColor: Color.fromRGBO(222, 179, 173, 1.0),
                      onTap: () async {
                        print(image.path);
                        GallerySaver.saveImage(image.path).then((path) => {
                          _showMaterialDialog(
                              "Save image!!", "Save Image Successfully")
                        });
                      },
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

  Future<File> saveImagePermanent(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = base64Decode(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

