import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:style_app/choose_style/ShoseStylePage.dart';

class LowerStylePage extends StatefulWidget {
  const LowerStylePage({super.key});

  @override
  State<LowerStylePage> createState() => _LowerStylePageState();
}

class _LowerStylePageState extends State<LowerStylePage> {
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
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080187600781342/lower_vintage_964.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080188049575976/lower_vintage_992.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080565717291129/lower_sweet_81.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080565918597130/lower_sweet_908.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080883368701952/lower_sexy_996.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080883582615622/lower_sexy_69.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080978940104704/lower_minimal_921.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105080979254689812/lower_minimal_990.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081109550743633/lower_casual_948.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081110679007242/lower_casual_99.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081323535740978/lower_street_914.jpg",
    "https://cdn.discordapp.com/attachments/743841976365088841/1105081323762237450/lower_street_972.jpg"
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
                    "Select Your Style ($selectCount/3)",
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
                              return const ShoseStylePage();
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