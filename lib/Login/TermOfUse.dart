import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/Login/Login.dart';
import 'package:style_app/choose_style/Birthdays.dart';
import 'package:style_app/choose_style/choose_style.dart';
import 'package:style_app/home/StartPage.dart';

import '../controller/user_state.dart';

class TermsofUse extends StatefulWidget {
  const TermsofUse({Key? key}) : super(key: key);

  @override
  State<TermsofUse> createState() => _TermsofUseState();
}

class _TermsofUseState extends State<TermsofUse> {
  final userController = Get.put(UserController());

  @override
  void initState() {
    print(userController.userID.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 179, 173, 1.0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text(
                'Terms of use',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 241, 240, 1.0),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('เงื่อนไขการใช้บริการ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                        Text('(Term and Conditions of Use)',
                            style: TextStyle(fontSize: 12)),
                        Text('แอปพลิเคชัน NGstyle',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: const Text(
                            '   “เงื่อนไขการใช้บริการ” ที่กำหนดนี้จะครอบคลุมสิทธิบัตรและภาระหน้าที่ในการใช้งานแอปพลิเคชันบนมือถือ ซึ่งต่อไปจะเรียกว่า “บริการ” ที่กระทรวงพานิชย์ ซึ่งต่อไปจะเรียกว่า “กระทรวง” จัดให้บริการผ่านทางอินเทอร์เน็ต โดยเงื่อนไขการใช้บริการถือเป็นข้อตกลงที่มีผลผูกพันธ์ระหว่างแอปพลิเคชัน ซึ่งเป็นเจ้าของกรรมสิทธิ์และสิทธิในทรัพย์สินทางปัญญาของบริการกับท่าน ดังนั้นแอปพลิเคชัน จึงขอให้ท่านอ่าน และพิจารณาเงื่อนไขการใช้บริการที่กำหนดโดยละเอียด',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 8.0, right: 8.0),
                          child: Text(
                              'เมื่อท่านใช้บริการแอปพลิเคชัน ย่อมถือว่าท่านยินยอมและยอมรับที่จะผูกพันธ์และปฏิบัติตาม',
                              style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8,left: 30.0,right: 8),
                          child: Row(
                            children: [
                              Text('•	เงื่อนไขการใช้บริการที่กำหนดไว้',style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('•	นโยบายการคุ้มครองข้อมูลส่วนบุคคลของ'
                              'กระทรวงฯ ซึ่งต่อไปจะเรียกว่า “นโยบายคุ้มครองข้อมูลส่วนบุคคล” และ',style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('•	นโยบายทรัพย์สินทางปัญญาของกระทรวงฯ ซึ่งต่อไปจะเรียกว่า “นโยบายทรัพย์สินทางปัญญา” ซึ่งทั้งหมดดังกล่าวข้างต้นถือว่าเป็นส่วนหนึ่งของเงื่อนไขการให้บริการ ',style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('ข้อตกลงการใช้งานแอปพลิเคชัน NGstyle มีดังนี้',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('ข้อมูลส่วนตัว',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เพื่อให้คุณสามารถใช้งานแอปพลิเคชัน NGstyle ได้อย่างเต็มประสิทธิภาพ แอปพลิเคชันจำเป็นต้องเก็บข้อมูลส่วนตัวของคุณ ซึ่งอาจรวมถึงชื่อ, ที่อยู่อีเมล, วันเกิด และข้อมูลอื่น ๆ ที่เกี่ยวข้องกับบัญชีของคุณ',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('เก็บข้อมูลการเข้าสู่ระบบผ่านไลน์',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เพื่อความสะดวกและรวดเร็วในการเข้าสู่ระบบ NGstyle แอปพลิเคชันจะรับข้อมูลการเข้าสู่ระบบของคุณผ่านบัญชีไลน์ของคุณ โปรดทราบว่าเราจะเก็บข้อมูลเฉพาะที่จำเป็นเท่านั้นและจะไม่เข้าถึงข้อมูลส่วนตัวอื่น ๆ ในบัญชีของคุณ การใช้ข้อมูลการเข้าสู่ระบบผ่านไลน์ของคุณจะเป็นไปตามข้อกำหนดและเงื่อนไขของไลน์เอง',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การถ่ายรูปภาพการแต่งกายแบบเต็มตัว',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('NGstyle อาจให้คุณถ่ายรูปภาพการแต่งกายแบบเต็มตัว เพื่อให้สามารถสร้างสไตล์และทรงผมที่ใช่สำหรับคุณ โปรดทราบว่ารูปภาพที่คุณถ่ายจะถูกจัดเก็บบนเซิร์ฟเวอร์ของเรา แต่เราจะไม่ใช้ข้อมูลรูปภาพในเชิงพาณิชย์หรือเผยแพร่ไปยังบุคคลภายนอกโดยไม่ได้รับความยินยอมจากคุณ รูปภาพที่ถ่ายในแอปพลิเคชันนี้จะถูกควบคุมโดยคุณเอง และคุณมีความรับผิดชอบต่อการเผยแพร่รูปภาพที่คุณตัดสินใจที่จะแชร์',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การใช้งานอย่างระมัดระวัง',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('คุณต้องใช้งานแอปพลิเคชัน NGstyle อย่างระมัดระวังและในขอบเขตที่ถูกต้อง ไม่นำมาใช้เพื่อการกระทำที่ผิดกฎหมาย หรือกระทำใด ๆ ที่ก่อให้เกิดความเสียหายแก่ผู้อื่น และไม่ละเมิดสิทธิ์และความเป็นส่วนตัวของบุคคลอื่น',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การรักษาความลับและความปลอดภัย',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เรามุ่งมั่นในการรักษาความลับและความปลอดภัยของข้อมูลที่คุณให้มาทั้งหมด แต่คุณยินยอมว่าไม่มีระบบการสื่อสารอิเล็กทรอนิกส์ใดที่เป็นอันตรายอย่างสมบูรณ์ ดังนั้น การส่งข้อมูลผ่านแอปพลิเคชัน NGstyle จะเป็นความรับผิดชอบของคุณเอง',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การปรับปรุงและการเปลี่ยนแปลง',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เราอาจปรับปรุงและเปลี่ยนแปลงแอปพลิเคชัน NGstyle ในอนาคตเพื่อปรับปรุงประสิทธิภาพ การทำงาน หรือเพิ่มฟีเจอร์ใหม่ โปรดตรวจสอบข้อตกลงการใช้งานเป็นประจำเพื่อทราบข้อมูลอัปเดต',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การใช้งานของบุคคลที่สาม',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('หากคุณมีต้องการให้บุคคลที่สามใช้งานแอปพลิเคชัน NGstyle ในชื่อของคุณหรือด้วยบัญชีของคุณ คุณต้องรับผิดชอบต่อการให้ความยินยอมและรับรองว่าคุณได้รับอนุญาตจากบุคคลดังกล่าวให้ใช้ข้อมูลและบัญชีของคุณ',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การอัปเดตข้อมูลส่วนตัว',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('คุณมีความรับผิดชอบในการอัปเดตและรักษาข้อมูลส่วนตัวของคุณให้เป็นปัจจุบัน โปรดตรวจสอบและแก้ไขข้อมูลส่วนตัวเมื่อมีการเปลี่ยนแปลง เพื่อให้ข้อมูลของคุณคงเป็นที่ถูกต้องและเป็นปัจจุบันที่สุด',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การลิขสิทธิ์และทรัพย์สินทางปัญญา',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('คุณตกลงว่าแอปพลิเคชัน NGstyle และเนื้อหาที่เกี่ยวข้องทั้งหมดเป็นทรัพย์สินทางปัญญาของเราหรือเจ้าของลิขสิทธิ์และอยู่ภายใต้การปกป้องทรัพย์สินทางปัญญาตามกฎหมายที่เกี่ยวข้อง คุณต้องไม่ทำซ้ำ ทำซ้ำ หรือละเมิดลิขสิทธิ์หรือสิทธิบัตรของเราหรือบุคคลที่สาม และไม่ให้การเข้าถึงแอปพลิเคชัน NGstyle นั้นมีผลกระทบต่อลิขสิทธิ์หรือสิทธิบัตรของผู้อื่น',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การให้ข้อมูลและความรับผิดชอบ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เมื่อคุณให้ข้อมูลหรือเผยแพร่เนื้อหาผ่านแอปพลิเคชัน NGstyle คุณรับผิดชอบในความถูกต้องและความครบถ้วนของข้อมูลดังกล่าว นอกจากนี้คุณยินยอมให้เราใช้ข้อมูลดังกล่าวตามนโยบายความเป็นส่วนตัวที่ระบุในข้อตกลงการใช้งานนี้',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การแจ้งปัญหาและการสนับสนุน',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('หากคุณพบปัญหาหรือมีคำถามเกี่ยวกับการใช้งานแอปพลิเคชัน NGstyle คุณสามารถติดต่อทีมสนับสนุนของเราได้ผ่านช่องทางที่เรามีให้ โปรดแจ้งปัญหาที่เกิดขึ้นหรือให้คำแนะนำเพื่อเราจะได้รับทราบและดำเนินการแก้ไขหรือสนับสนุนให้คุณได้อย่างทันท่วงที',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 8.0,right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('การเปลี่ยนแปลงข้อตกลงการใช้งาน',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 8.0,left: 30.0),
                          child: Text('เราอาจปรับปรุงและเปลี่ยนแปลงข้อตกลงการใช้งานแอปพลิเคชัน NGstyle ในอนาคต เมื่อเราทำการเปลี่ยนแปลงดังกล่าว เราจะแจ้งให้คุณทราบล่วงหน้าในรูปแบบที่เหมาะสม เพื่อให้คุณสามารถทราบและตรวจสอบข้อกำหนดและเงื่อนไขใหม่',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Text('โปรดทราบว่าข้อตกลงการใช้งานนี้เป็นข้อตกลงระหว่างคุณและทางเราเท่านั้น การใช้งานแอปพลิเคชัน NGstyle ถือเป็นการยินยอมและยอมรับข้อตกลงและเงื่อนไขการใช้งานทั้งหมดที่ระบุไว้ในข้อตกลงนี้',style: TextStyle(fontSize: 12,fontFamily: 'assets/fonts/BalooDa-Regular.ttf')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Birthdays()));
                  },
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(130, 190, 129, 1.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartPage()));
                  },
                  child: Text('Decline'),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color.fromRGBO(238, 111, 111, 1.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
