import 'package:flutter/material.dart';
import 'package:style_app/IndexPreview.dart';

class AboutNG extends StatefulWidget {
  const AboutNG({Key? key}) : super(key: key);

  @override
  State<AboutNG> createState() => _AboutNGState();
}

class _AboutNGState extends State<AboutNG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 179, 173, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: const Text(
                'About NGstyle',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 241, 240, 1.0),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '    เป็นแอปพลิเคชันที่เก็บข้อมูลผู้ใช้งานไปทำการวิเคราะห์ข้อมูลสไตล์การแต่งกายของผู้ใช้งาน เนื่องจากทางแอปพลิเคชันได้นำข้อมูลไปวิเคราะห์สไตล์การแต่งกายของผู้ใช้งานเป็นรูปภาพว่าในลักษณะที่ผู้ใช้ใส่นั้นเป็นรูปแบบลักษณะสไตล์ใด และแนะนำเสื้อผ้าลักษณะที่ใกล้เคียงให้กับผู้ใช้งานได้',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text(
                                '   ซึ่งลักษณะการแต่งกายของแอปพลิเคชันที่นำมาแสดงมี 6 สไตล์ ดังนี้',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily:
                                        'assets/fonts/BalooDa-Regular.ttf')),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   1) Minimal Style',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   เป็นการแต่งกายที่สามารถแต่งกายได้ทั้งชายและหญิง ซึ่งเป็นการแต่งกาย ที่ได้รับความนิยมมากที่สุดกับในยุคปัจจุบัน เนื่องจากสามารถแต่งได้ทุกโอกาส โดยมีลักษณะเป็นเสื้อยืด เสื้อยืดแขนสั้น เสื้อ ยืดแขนยาว เสื้อเชิ้ตแขนสั้น เสื้อโอเวอร์ไซส์ เสื้อหรือกางเกงที่มีลักษณะสีพื้นเป็นรูปแบบขาสั้นหรือขายาวก็ได้ รองเท้าผ้าใบสี พื้น รองเท้าแตะ รองเท้าผ้าใบ ซึ่งโดยรวมแล้วการแต่งกายในรูปแบบ Minimal เป็นการแต่งกายที่ไม่เน้นสีที่มความรุนแรง จะ ออกไปทางโทนสีที่ดูสบายตา ดูเรียบ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   2) Casual Style ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   เป็นการแต่งกายที่จะออกแนวไปเน้นเป็นทางการหรือกึ่งทางการ ซึ่งเป็น การแต่งกายที่เป็นการทำงาน ติดต่องานราชการต่างๆ เป็นต้น และการแต่งกายแบบทางการเป็นการแต่งกายมีความสุภาพต่อ ผู้อื่นและตัวเอง',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   3) Sexy Style ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   เป็นการแต่งกายรูปแบบเสื้อผ้าน้อยชิ้นหรือการแต่งกายที่เห็นรูปร่างของตัวผู้ ใส่เอง ส่วนมากเราจะพบเห็นได้ที่ทะเล หรืองานอีเวนต์การเดินแบบต่างๆ ซึ่งลักษณะของเสื้อผ้าได้แก่ เสื้อลายตะข่าย เสื้อบีกิน นี่กางเกงหนัง กางเกงรัดรูป รองเท้าส้นสูง เป็นต้น โดยรวมแล้วการแต่งกายที่มีแรงดึงดูดให้ผู้คนมอง',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   4) Street Style ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   ซึ่งเป็นการแต่งกายที่มีความมั่นใจสูง มีลักษณะสีที่โดดเด่น สามารถมองเห็นได้ อย่างชัดเจน โดยที่ในประเทศไทยพบเห็นอยู่บ้างเล็กน้อย แต่พบเจอได้ที่งานออกเต้นเพลง Cover เกาหลี เป็นต้น แล้วลักษณะ ของเครื่องแต่งกายมีลักษณะที่มีสีฉูดฉาด เสื้อโค้ทตัวใหญ่ รองเท้าสีสันสดใส เป็นต้น',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   5) Sweet Style ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   เป็นรูปแบบสไตล์ที่มีความน่ารัก ความหวาน โดยมองรวมๆแล้วมีความน่า อ่อนโยน จะพบเห็นในผู้หญิงเป็นส่วนใหญ่ ส่วนของสไตล์นี้ผู้ชายจะเน้นแต่งเป็นแนวโทนสีหวานๆ ชมพูในแบบของผู้ชาย ซึ่ง ลักษณะเครื่องแต่งกาย ได้แก่ เสื้อยืด เสื้อเชิ้ต สีโทนหวาน กระโปรงขาว กระโปรงลายจุด รองเท้ามีลวดลายที่น่ารัก เป็นต้น ซึ่งมองโดยรวมแล้วเป็นการแต่งกายที่ออกแนวน่ารักๆ ดูอ่อนโยนน่าถะนุถนอม',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Text('   6) Vintage Style ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 35.0, right: 8.0, bottom: 8.0),
                            child: Text('   เป็นการแต่งกายที่สามารถแต่งได้ทุกเพศ ทุกวัย ซึ่งเป็นการแต่งกายที่แมชท์ กับสไตล์อื่นได้ และการแต่งตัวที่เปลี่ยนไปตามยุคสมัยเป็นการแต่งกายแบบ Y2K ก็ถือเป็นวินเทจด้วย นอกจากนี้ลักษณะ เครื่องแต่งกายของวินเทจมีลักษณะ เสื้อลายดอกไม้ เสื้อลายสก๊อต เสื้อยุค 90 กางเกงยีนส์ กางเกงยีนส์ขาบาน รองเท้าผ้าใบ เก่า เป็นต้น',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf',
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '    และทางแอปพลิเคชันยังสามารถแนะนำเสื้อผ้าที่มีลักษณะการแต่งกายให้กับผู้ใช้งานได้ โดยผ่านการเลือกจากการเข้าใช้งานในการสมัครครั้งแรก ซึ่งจะให้ผู้ใช้เลือกเสื้อ กางเกง และรองเท้าในสิ่งที่ตนเองชอบ แล้วทางแอปพลิเคชันจะนำผลรูปภาพที่ผู้ใช้เลือกไปทำการแนะนำเสื้อผ้าที่ใกล้เคียงให้กับผู้ใช้งาน และอีกหนึ่งฟีเจอร์คือฟีเจอร์การทำนายผลของทางแอปพลิเคชัน ซึ่งผู้ใช้สามารถถ่ายรูปภาพตนเองแบบเต็มตัวได้ เพื่อให้ผู้ใช้ทราบรูปแบบการแต่งกายของตนเองในรูปแบบปัจจุบันได้ว่าเป็นในรูปแบบสไตล์ใด และผู้ใช้ยังสามารถรับคำแนะนำจากเสื้อผ้าที่ใกล้เคียงของตนเองได้จากการเลือกทั้งสามส่วน โดยการแนะนำเป็นการแนะนำรูปภาพที่ใกล้เคียงและไม่มีถูกผิดผู้ใช้สามารถนำไปประยุกต์กับการแต่งกายของตนเองได้ในปัจจุบัน',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'assets/fonts/BalooDa-Regular.ttf'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IndexPreview()));
                },
                child: Text('Exit'),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: const Color.fromRGBO(238, 111, 111, 1.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
