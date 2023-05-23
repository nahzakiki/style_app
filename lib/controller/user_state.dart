import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var userID = "".obs();
  var birthDate = "".obs();
  var top1 = "".obs();
  var top2 = "".obs();
  var top3 = "".obs();
  var low1 = "".obs();
  var low2 = "".obs();
  var low3 = "".obs();
  var shoe1 = "".obs();
  var shoe2 = "".obs();
  var shoe3 = "".obs();

  void setUserID(String uid){
    userID = uid;
  }

  void setBirthDate(String bd){
    birthDate = bd;
  }
}