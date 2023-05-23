import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:style_app/services/api.dart';

import '../controller/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Get.put(UserController());
  final List<String> StylesList = [
    'For You',
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];
  //final storage = FirebaseStorage.instanceFor(bucket: "gs://my-custom-bucket");
  List<String> pageList = [
    'For You',
    'Minimal Style',
    'Sweet Style',
    'Vintage Style',
    'Sexy Style',
    'Street Style',
    'Casual Style'
  ];

  int _activeIndex = 0;
  late Future<List> _clothesList;

  @override
  void initState() {
    _clothesList = _getClothes();
    super.initState();
  }

  Future<List> _getClothes() async {
    String style = pageList[_activeIndex].split(" ")[0];
    return await Api().getClothes('clothes', style.toLowerCase(), userController.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LOGO1.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildButton(),
                  ],
                ),
              ),
              FutureBuilder<List>(
                future: _clothesList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return LoadingAnimationWidget.fourRotatingDots(
                            color: Color.fromRGBO(222, 179, 173, 1.0),
                            size: 40); //เปลื่ยน loader หา สวยมาเดี๋ยวรันโมโห
                  }

                  if (snapshot.hasError) {
                    return Text("เกิดข้อผิดพลาด ${snapshot.error}");
                  }

                  if (snapshot.hasData) {
                    var data = snapshot.data!;

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
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(data[index].url));
                          },
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              )
              //_buildSubPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      children: [
        for (int i = 0; i < StylesList.length; i++)
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _activeIndex = i;
                    _clothesList = _getClothes();
                  });
                },
                child: Text(
                  '${StylesList[i]}',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: (_activeIndex == i)
                        ? Color.fromRGBO(222, 179, 173, 1.0)
                        : Color.fromRGBO(223, 211, 248, 1.0))),
          ),
      ],
    );
  }
}
