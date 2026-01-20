import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //saved username ke sharedpreferences
  void login()async{
    if(usernameController.text.toString() == "admin" &&
     passwordController.text.toString() == "admin"){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.mainmenu);
    }else{
      Get.snackbar("ERROR", "Incorrect username or password");
    }
  }

  void logout()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.snackbar("Log out", "Berhasil Logout");
    Get.offAllNamed(AppRoutes.login);
  }


}