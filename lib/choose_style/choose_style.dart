import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:style_app/Login/TermOfUse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:style_app/choose_style/TopStylePage.dart';

class ChooseStyle extends StatefulWidget {
  const ChooseStyle({super.key});

  @override
  State<ChooseStyle> createState() => _ChooseStyleState();
}

class _ChooseStyleState extends State<ChooseStyle> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int activePage = 0;
  List<String> images = [
    "https://cdn.discordapp.com/attachments/743841976365088841/1105035601637548042/2e2ecdd2bba5552f3be7b99c22885b72.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105035635053572186/2cfb588853436fa3fa5399e7c281ae71.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105035666942873610/b98437e194afa74c6c2c0580791b69c0.jpg"
  ];

  List<String> minimal_images = [
    "https://cdn.discordapp.com/attachments/743841976365088841/1105035815777734676/1ea50a35ea6581f05ad2e12c5a3e4ddc.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105035850166837259/7e0024e31a443b25a05eb69a58c37fe0.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036094258565190/e9894a8a23e1be363f53a92048b5f21f.jpg"
  ];

  List<String> sweet_images = [
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036224684642314/5f2181dfad46ea2d89257f49308f77e1.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036262169120849/123e5f11a9381ff3360ac2719d8d60cd.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036294851145758/d36932472264d786233beaa765d21d61.jpg"
  ];

  List<String> street_images = [
    "https://media.discordapp.net/attachments/743841976365088841/1105036495754100766/1c6126264b4091af5be92a8c6fd29bf2.jpg",
    "https://media.discordapp.net/attachments/743841976365088841/1105036496060293180/61d7f15df834b1758a1fc2b20649d913.jpg",
    "https://media.discordapp.net/attachments/743841976365088841/1105036496257437716/67eb7cf489eda57f7cd21dfb4ee6eae5.jpg"
  ];

  List<String> sexy_image = [
    "https://media.discordapp.net/attachments/743841976365088841/1105051944877301802/1a283e829d566d5f85787e1938ecb761.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105051945149939803/12f8650e233aa634c9b6a871e8bf47f3.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105052166592401488/e5d9e991626901addfb35023d2a5b2ad.jpg"
  ];

  List<String> caual_image = [
    "https://media.discordapp.net/attachments/743841976365088841/1105036769143050260/MEN-Jackets_Vests-id_00006912-08_7_additional.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036769377927208/2f954639dff964ad6a967d46d85aa347.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105036816710643742/c888275b58a2134de91e5cccfca4a514.jpg"
  ];

  String _part = "TOP";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(222, 179, 173, 1.0),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 145,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white
                          ),
                          child: const Text(
                            "     Vintage Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: images
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 145,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white
                          ),
                          child: const Text(
                            "     Minimal Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: minimal_images
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white
                          ),
                          child: const Text(
                            "     Sweet Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: sweet_images
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white
                          ),
                          child: const Text(
                            "     Street Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: street_images
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white
                          ),
                          child: const Text(
                            "     Sexy Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: sexy_image
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 135,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white
                          ),
                          child: const Text(
                            "     Casual Style",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                              aspectRatio: 0.8),
                          items: caual_image
                              .map(
                                (e) => AspectRatio(
                                  aspectRatio: 16 / 9, //aspect ratio for Image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image(
                                      image: NetworkImage(e),
                                      fit: BoxFit.fill,
                                      //fill type of image inside aspectRatio
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const TopStylePage();
                        }));
                      },
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
