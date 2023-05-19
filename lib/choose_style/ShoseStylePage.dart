import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:style_app/choose_style/LoadingPage.dart';

class ShoseStylePage extends StatefulWidget {
  const ShoseStylePage({super.key});

  @override
  State<ShoseStylePage> createState() => _ShoseStylePageState();
}

class _ShoseStylePageState extends State<ShoseStylePage> {
  int activePage = 0;
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
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081527529906186/shoe_street_962.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081527756406864/shoe_street_98.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081686439497750/shoe_sexy_813.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081686657618000/shoe_sexy_853.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081847895052308/shoe_minimal_809.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081848100569138/shoe_minimal_807.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082031349698610/shoe_casual_17.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082031559426189/shoe_casual_940.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082307683024916/shoe_sweet_867.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082307976634459/shoe_sweet_98.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082414834913340/shoe_vintage_606.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105082415082389555/shoe_vintage_605.jpg"
  ];

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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                              return const LoadingSelectPage();
                            }));
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