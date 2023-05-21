import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var userID = "".obs();
  var birthDate = "".obs();

  void setUserID(String uid){
    userID = uid;
  }

  void setBirthDate(String bd){
    birthDate = bd;
  }
}