import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:style_app/choose_style/LowerStylePage.dart';
import 'package:style_app/services/api.dart';

import '../controller/user_state.dart';

class TopStylePage extends StatefulWidget {
  const TopStylePage({super.key});

  @override
  State<TopStylePage> createState() => _TopStylePageState();
}

class _TopStylePageState extends State<TopStylePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int activePage = 0;
  final userController = Get.put(UserController());
  List<bool> selects = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> images = [
    "https://cdn.discordapp.com/attachments/743841976365088841/1105065132620525568/top_vintage_926.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105065132347904070/top_vintage_810.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105065650063429642/top_sweet_895.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105065650294104144/top_sweet_93.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066189249597560/top_street_993.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066189488652298/top_street_971.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066327099580458/top_sexy_94.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066327380611072/top_sexy_993.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066599075020800/top_minimal_830.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066599574147112/top_minimal_47.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066877266448424/top_casual_983.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105066877685874748/top_casual_661.jpg"
  ];

  List<String> url = ["", "", ""];
  int selectCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            color: const Color.fromRGBO(222, 179, 173, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text(
                    "Select your style? ($selectCount/3)",
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (selectCount < 3) {
                                selects[index] = !selects[index];
                                url[selectCount] = images[index];
                                if (selects[index]) {
                                  selectCount++;
                                }else{
                                  selectCount--;
                                }
                              }else{
                                if(selects[index]) {
                                  selects[index] = !selects[index];
                                  selectCount--;
                                }
                              }
                            });
                          },
                          child: Card(
                            color: selects[index] ? const Color.fromRGBO(102, 54, 53, 1) : Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(images[index])),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                          onPressed: selectCount >= 3 ? () {
                            Api().imageSearchForNew("image/search/new", url[0], url[1], url[2], userController.userID);
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (BuildContext context) {
                            //   return const LowerStylePage();
                            // }));
                          }: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(102, 54, 53, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          child: const Text(
                            'NEXT',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                    'assets/fonts/Inter-VariableFont_slnt,wght.ttf'),
                          )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
