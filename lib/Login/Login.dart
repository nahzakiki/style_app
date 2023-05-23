import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:style_app/IndexPreview.dart';
import 'package:style_app/Login/TermOfUse.dart';
import 'package:style_app/controller/user_state.dart';
import 'package:style_app/home/HomePage.dart';
import 'package:style_app/services/api.dart';
import 'package:style_app/services/google_sign_in.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final userController = Get.put(UserController());

  void lineSDKInit() async{
    await LineSDK.instance.setup("1661185926").then((_){
      print("LineSDK is Prepared");
    });
  }

  @override
  void initState() {
    lineSDKInit();
    super.initState();
  }

  Future getAccessToken() async{
    try {
      final result = await LineSDK.instance.currentAccessToken;
      return result!.value;
    }  on PlatformException catch (e) {
      print(e.message);
    }
  }


  void startLineLogin() async {
    try {
      final result = await LineSDK.instance.login(scopes: ["profile", "openid", "email"]);
      print(result.toString());
      var accesstoken = await getAccessToken();
      var displayname = result.userProfile!.displayName;
      var statusmessage = result.userProfile!.statusMessage;
      var imgUrl = result.userProfile!.pictureUrl;
      var userId = result.userProfile!.userId;
      var email = result.userProfile!.data.toString();

      print("AccessToken> " + accesstoken);
      print("DisplayName> " + displayname);
      print("StatusMessage> " + statusmessage!);
      print("ProfileURL> " + imgUrl!);
      print("userId> " + userId);
      print("data> " + email!);

      var res = await Api().lineLogin("login", displayname, statusmessage, imgUrl, userId);
      if(res['message'] == "success") {
        userController.setUserID(userId);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const TermsofUse();
        }));
      }else if(res['message'] == "already"){
        userController.setUserID(userId);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return const IndexPreview();
            }));
      }
    } on PlatformException catch (e) {
      print(e);
      switch (e.code.toString()) {
        case "CANCEL":
        //showDialogBox("คุณยกเลิกการเข้าสู่ระบบ", "เมื่อสักครู่คุณกดยกเลิกการเข้าสู่ระบบ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
          print("User Cancel the login");
          break;
        case "AUTHENTICATION_AGENT_ERROR":
        //showDialogBox("คุณไม่อนุญาติการเข้าสู่ระบบด้วย LINE", "เมื่อสักครู่คุณกดยกเลิกการเข้าสู่ระบบ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
          print("User decline the login");
          break;
        default:
        //showDialogBox("เกิดข้อผิดพลาด", "เกิดข้อผิดพลาดไม่ทราบสาเหตุ กรุณาเข้าสู่ระบบใหม่อีกครั้ง");
          print("Unknown but failed to login");
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 241, 240, 1.0),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/LOGO1.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'Create account / Login',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(172, 170, 169, 1.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: Colors.green),
                        onPressed: () {
                          startLineLogin();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon/icons8-line-48.png',
                              width: 50,
                              height: 40,
                            ),
                            Text("Continue with Line",style: TextStyle(fontSize: 16),)
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<GoogleSignInAccount?> _googleSignIn() async {
    return await GoogleSignInApi.login();
  }
}
