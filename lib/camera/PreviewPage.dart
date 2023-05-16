import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/models/styleModel.dart';
import 'package:style_app/services/api.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class PreviewPage extends StatefulWidget {
  final XFile image;
  const PreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late XFile image;
  String albumName = 'Media';
  bool _isLoading = false;
  String className = "Loading...";
  bool value = false;

  void fetchResult() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Map<String, String> styleMap = {
        "vintage": "Vintage Style",
        "sexy": "Sexy Style",
        "casual": "Casual Style",
        "street": "Street Style",
        "sweet": "Sweeet Style",
        "minimal": "Minimal Style",
      };
      final response = await Api().submit("predict", image);
      Map<String, dynamic> jsonData = jsonDecode(response);
      print(jsonData);
      StyleModel resultMap = StyleModel.fromJson(jsonData);
      className = styleMap[resultMap.top?.className]!;

      if (resultMap.top!.className! != resultMap.low!.className!) {
        setState(() {
          className += ", ${styleMap[resultMap.low?.className]!}";
        });
      }
      if ((resultMap.shoe!.className! != resultMap.top!.className!) &&
          (resultMap.shoe!.className! != resultMap.low!.className!)) {
        setState(() {
          className += ", ${styleMap[resultMap.shoe?.className]!}";
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.image = widget.image;
    fetchResult();
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
    return Stack(
      children: [
        Scaffold(
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
                    AutoSizeText(
                      className,
                      maxLines: 1,
                    ),
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
                    child: Image.file(File(image.path),
                        fit: BoxFit.cover, width: 300),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(102, 54, 53, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Detail',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Card(
                                            color: const Color.fromRGBO(
                                                237, 192, 192, 1),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        "https://cdn.discordapp.com/attachments/743841976365088841/1105123339598569555/outfit.jpg",
                                                        width: 100.0,
                                                      )),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Sweet Style"),
                                                        Text("Confidence: 80%"),
                                                        Row(
                                                          children: [
                                                            RoundCheckBox(
                                                              onTap:
                                                                  (selected) {},
                                                              size: 30,
                                                              uncheckedColor:
                                                                  Colors.red,
                                                              uncheckedWidget:
                                                                  Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                                size: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                                "Select other style")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color.fromRGBO(
                                                237, 192, 192, 1),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        "https://cdn.discordapp.com/attachments/743841976365088841/1105123339846041731/outfit_1.jpg",
                                                        width: 100.0,
                                                      )),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Sweet Style"),
                                                        Text("Confidence: 80%"),
                                                        Row(
                                                          children: [
                                                            RoundCheckBox(
                                                              onTap:
                                                                  (selected) {},
                                                              size: 30,
                                                              uncheckedColor:
                                                                  Colors.red,
                                                              uncheckedWidget:
                                                                  Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                                size: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                                "Select this style")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: const Color.fromRGBO(
                                                237, 192, 192, 1),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        "https://cdn.discordapp.com/attachments/743841976365088841/1105123451708129310/rmbg_1.jpg",
                                                        width: 100.0,
                                                      )),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Sweet Style"),
                                                        Text("Confidence: 80%"),
                                                        Row(
                                                          children: [
                                                            RoundCheckBox(
                                                              onTap:
                                                                  (selected) {},
                                                              size: 30,
                                                              uncheckedColor:
                                                                  Colors.red,
                                                              uncheckedWidget:
                                                                  Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                                size: 15,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                                "Select this style")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'RECOMANDATIONS',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                shape: StadiumBorder(),
                                                primary: Colors.brown),
                                          ),
                                        ]),
                                  ),
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 6, bottom: 8, left: 20, right: 20),
                          child: Text(
                            "Detail",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
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
        ),
        if (_isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 0.8),
            child: Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: Color.fromRGBO(222, 179, 173, 1.0), size: 50),
            ),
          ),
      ],
    );
  }

  Future<File> saveImagePermanent(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = base64Decode(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}
