import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var userID = "".obs();

  void setUserID(String uid){
    userID = uid;
  }
}