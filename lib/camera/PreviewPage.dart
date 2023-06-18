import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/models/styleModel.dart';
import 'package:style_app/services/api.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../controller/user_state.dart';

class PreviewPage extends StatefulWidget {
  final XFile image;
  const PreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final userController = Get.put(UserController());
  late XFile image;
  late StyleModel resultMap;
  String albumName = 'Media';
  bool _isLoading = false;
  String className = "Loading...";
  bool value = false;
  bool showImage = false;
  bool _load = false;
  Future<List>? _clothesList;

  Future<List> _getClothes() async {
    return await Api()
        .getClothes('clothes', 'recom_you', userController.userID);
  }

  Map<String, String> styleMap = {
    "vintage": "Vintage Style",
    "sexy": "Sexy Style",
    "casual": "Casual Style",
    "street": "Street Style",
    "sweet": "Sweet Style",
    "minimal": "Minimal Style",
  };

  List<String> _options = [
    'Minimal Style',
    'Vintage Style',
    'Sweet Style',
    'Casual Style',
    'Sexy Style',
    'Street Style'
  ];

  String? _selectedTop;
  String? _selectedLow;
  String? _selectedShoe;
  bool? _enableTop = false;
  bool? _enableLow = false;
  bool? _enableShoe = false;

  void fetchResult() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Api().submit("predict", image);
      Map<String, dynamic> jsonData = jsonDecode(response);
      print(jsonData);
      resultMap = StyleModel.fromJson(jsonData);
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
    _clothesList = _getClothes();
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
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return DraggableScrollableSheet(
                                      expand: false,
                                      builder: (context, scrollController) {
                                        return SingleChildScrollView(
                                          controller: scrollController,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional
                                                  .topCenter,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                    child: Container(
                                                  width: 60,
                                                  height: 7,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.black12,
                                                  ),
                                                )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text('Detail',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                        Card(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              237, 192, 192, 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child: Image
                                                                        .memory(
                                                                      base64Decode(resultMap
                                                                          .top!
                                                                          .base64!),
                                                                      width:
                                                                          100.0,
                                                                    )),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(styleMap[resultMap
                                                                          .top
                                                                          ?.className]!),
                                                                      Text(
                                                                          "Confidence: ${(resultMap.top!.confidence! * 100).toStringAsFixed(2)}%"),
                                                                      Row(
                                                                        children: [
                                                                          Checkbox(
                                                                            shape: CircleBorder(),
                                                                            activeColor: Colors.green,
                                                                            checkColor:
                                                                                Colors.white,
                                                                            value:
                                                                                _enableTop,
                                                                            onChanged:
                                                                                (bool? value) {
                                                                              setState(() {
                                                                                print(_enableTop);
                                                                                if (_enableTop == true) {
                                                                                  _enableTop = false;
                                                                                } else {
                                                                                  _enableTop = true;
                                                                                }
                                                                              });
                                                                            },
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child:
                                                                                DropdownButton<String>(
                                                                              value: _selectedTop,
                                                                              hint: Text(
                                                                                "Select this style.",
                                                                                style: TextStyle(fontSize: 12),
                                                                              ),
                                                                              items: _options.map((String option) {
                                                                                return DropdownMenuItem<String>(
                                                                                  value: option,
                                                                                  child: Text(
                                                                                    option,
                                                                                    style: TextStyle(fontSize: 12),
                                                                                  ),
                                                                                );
                                                                              }).toList(),
                                                                              onChanged: !_enableTop!
                                                                                  ? null
                                                                                  : (String? newValue) {
                                                                                      setState(() {
                                                                                        _selectedTop = newValue!;
                                                                                      });
                                                                                    },
                                                                            ),
                                                                          ),
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
                                                          color: const Color
                                                                  .fromRGBO(
                                                              237, 192, 192, 1),
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .memory(
                                                                      base64Decode(resultMap
                                                                          .low!
                                                                          .base64!),
                                                                      width:
                                                                          100.0,
                                                                    )),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(styleMap[resultMap
                                                                          .low
                                                                          ?.className]!),
                                                                      Text(
                                                                          "Confidence: ${(resultMap.low!.confidence! * 100).toStringAsFixed(2)}%"),
                                                                      Row(
                                                                        children: [
                                                                          Checkbox(
                                                                            shape: CircleBorder(),
                                                                            activeColor: Colors.green,
                                                                            checkColor:
                                                                                Colors.white,
                                                                            value:
                                                                                _enableLow,
                                                                            onChanged:
                                                                                (bool? value) {
                                                                              setState(() {
                                                                                print(_enableLow);
                                                                                if (_enableLow == true) {
                                                                                  _enableLow = false;
                                                                                } else {
                                                                                  _enableLow = true;
                                                                                }
                                                                              });
                                                                            },
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child:
                                                                                DropdownButton<String>(
                                                                              value: _selectedLow,
                                                                              hint: Text(
                                                                                "Select this style.",
                                                                                style: TextStyle(fontSize: 12),
                                                                              ),
                                                                              items: _options.map((String option) {
                                                                                return DropdownMenuItem<String>(
                                                                                  value: option,
                                                                                  child: Text(
                                                                                    option,
                                                                                    style: TextStyle(fontSize: 12),
                                                                                  ),
                                                                                );
                                                                              }).toList(),
                                                                              onChanged: !_enableLow!
                                                                                  ? null
                                                                                  : (String? newValue) {
                                                                                      setState(() {
                                                                                        _selectedLow = newValue!;
                                                                                      });
                                                                                    },
                                                                            ),
                                                                          ),
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
                                                          color: const Color
                                                                  .fromRGBO(
                                                              237, 192, 192, 1),
                                                          shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .memory(
                                                                      base64Decode(resultMap
                                                                          .shoe!
                                                                          .base64!),
                                                                      width:
                                                                          100.0,
                                                                    )),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(styleMap[resultMap
                                                                          .shoe
                                                                          ?.className]!),
                                                                      Text(
                                                                          "Confidence: ${(resultMap.shoe!.confidence! * 100).toStringAsFixed(2)}%"),
                                                                      Row(
                                                                        children: [
                                                                          Checkbox(
                                                                            shape: CircleBorder(),
                                                                            activeColor: Colors.green,
                                                                            checkColor:
                                                                                Colors.white,
                                                                            value:
                                                                                _enableShoe,
                                                                            onChanged:
                                                                                (bool? value) {
                                                                              setState(() {
                                                                                print(_enableShoe);
                                                                                if (_enableShoe == true) {
                                                                                  _enableShoe = false;
                                                                                } else {
                                                                                  _enableShoe = true;
                                                                                }
                                                                              });
                                                                            },
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          DropdownButtonHideUnderline(
                                                                            child:
                                                                                DropdownButton<String>(
                                                                              value: _selectedShoe,
                                                                              hint: Text(
                                                                                "Select this style.",
                                                                                style: TextStyle(fontSize: 12),
                                                                              ),
                                                                              items: _options.map((String option) {
                                                                                return DropdownMenuItem<String>(
                                                                                  value: option,
                                                                                  child: Text(
                                                                                    option,
                                                                                    style: TextStyle(fontSize: 12),
                                                                                  ),
                                                                                );
                                                                              }).toList(),
                                                                              onChanged: !_enableShoe!
                                                                                  ? null
                                                                                  : (String? newValue) {
                                                                                      setState(() {
                                                                                        _selectedShoe = newValue!;
                                                                                      });
                                                                                    },
                                                                            ),
                                                                          ),
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
                                                          onPressed: () async {
                                                            setState((){
                                                              _load = true;
                                                              showImage = false;
                                                              _clothesList = null;
                                                            });
                                                            var p = await Api()
                                                                .imageSearchPredict(
                                                                    "fluttedReccomendation/imageSearch",
                                                                    resultMap
                                                                        .top!
                                                                        .base64!,
                                                                    _selectedTop,
                                                                    resultMap
                                                                        .low!
                                                                        .base64!,
                                                                    _selectedLow,
                                                                    resultMap
                                                                        .shoe!
                                                                        .base64!,
                                                                    _selectedShoe,
                                                                    userController
                                                                        .userID);
                                                            setState(() {
                                                              _load = false;
                                                              showImage = true;
                                                              _clothesList = _getClothes();
                                                            });
                                                          },
                                                          child: Text(
                                                            'RECOMMENDATION',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      StadiumBorder(),
                                                                  primary: Colors
                                                                      .brown),
                                                        ),
                                                        showImage
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      color: Color.fromRGBO(
                                                                          222,
                                                                          179,
                                                                          173,
                                                                          1.0)),
                                                                  child: Column(
                                                                    children: [
                                                                      FutureBuilder<
                                                                          List>(
                                                                        future:
                                                                            _clothesList,
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot.connectionState !=
                                                                              ConnectionState.done) {
                                                                            return LoadingAnimationWidget.fourRotatingDots(
                                                                                color: Color.fromRGBO(222, 216, 244, 1.0),
                                                                                size: 20);
                                                                          }

                                                                          if (snapshot
                                                                              .hasError) {
                                                                            return Text("เกิดข้อผิดพลาด ${snapshot.error}");
                                                                          }

                                                                          if (snapshot
                                                                              .hasData) {
                                                                            var data =
                                                                                snapshot.data!;

                                                                            if (data.length >
                                                                                0) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: SizedBox(
                                                                                  height: MediaQuery.of(context).size.height - 200,
                                                                                  child: MasonryGridView.count(
                                                                                    crossAxisCount: 2,
                                                                                    mainAxisSpacing: 8,
                                                                                    crossAxisSpacing: 8,
                                                                                    itemCount: data.length,
                                                                                    itemBuilder: (context, index) {
                                                                                      print(index);
                                                                                      print(data[index].url);
                                                                                      return ClipRRect(borderRadius: BorderRadius.circular(10.0), child: Image.network("${data[index].url}?timestamp=${DateTime.now().millisecondsSinceEpoch}"));
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    const Text('No Reccommendation.', style: TextStyle(fontSize: 18.0)),
                                                                                    const Text('or', style: TextStyle(fontSize: 18.0)),
                                                                                    const Text('Insufficient image in the database.', style: TextStyle(fontSize: 18.0)),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            }
                                                                          }
                                                                          return const SizedBox
                                                                              .shrink();
                                                                        },
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            : _load ? Padding(
                                                              padding: const EdgeInsets.only(top: 20.0),
                                                              child: LoadingAnimationWidget.fourRotatingDots(color: Color.fromRGBO(222, 216, 244, 1.0), size: 40.0),
                                                            ): SizedBox(height: 10),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                });
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
